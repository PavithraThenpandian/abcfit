import 'dart:convert';

import 'package:abc_fit/sevices/authenticate.dart';
import 'package:abc_fit/sevices/http_exception.dart';
import 'package:abc_fit/sevices/models.dart';
import 'package:abc_fit/widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './/pallete.dart';
import './/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emails = TextEditingController();
  // String email_string = email as String;

  final passwords = TextEditingController();
  bool _isloading = false;
  @override
  void initState() {
    emails = TextEditingController();
    super.initState();
    emails.addListener(() {
      setState(() {});
    });
    passwords.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emails.dispose();
    passwords.dispose();
    super.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        backgroundColor: kWhite,
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  // Map<String, dynamic> _authData = {
  //   'email': '',
  //   'password': '',
  // };

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = {
      'email': emails.text.trim(),
      'password': passwords.text.trim(),
    };

    Future<void> onlogin() async {
      try {
        await Provider.of<Auth>(context, listen: false)
            .login(map['email'], map['password'])
            .then((value) {
          setState(() {
            print(_isloading);
            _isloading = true;
          });
        });
        SharedPreferences preferences = await SharedPreferences.getInstance();
        var r = preferences.getString('userdata');
        if (r != null) {
          print(_isloading);
          _isloading
              ? Navigator.of(context).pushNamed('Home')
              : CircularProgressIndicator();
        }

        // Navigator.of(context).pushNamed('Home');
      } on HttpException catch (error) {
        // // Navigator.of(context).pushNamed('/');
        var errorMessage = 'Authentication failed';
        if (error.toString().contains('INVALID_EMAIL')) {
          errorMessage = 'This is not a valid email address';
          _showErrorDialog(errorMessage);
        } else if (error.toString().contains('INVALID_PASSWORD')) {
          errorMessage = 'Invalid Password.';
          _showErrorDialog(errorMessage);
        } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
          errorMessage = 'This email does not exist';
          _showErrorDialog(errorMessage);
        }
      } catch (error) {
        const errorMessage =
            'Could not authenticate you. Please try again later.';
        _showErrorDialog(errorMessage);
      }
    }

    // Future<void> _submit() async {
    //   await Provider.of<Auth>(context, listen: false)
    //       .login(email as String, password as String);
    // }

// void press(){
//   Navigator.of(context)
//                             .push(MaterialPageRoute(builder: (_) =>
//                           Authenticate(email,password);
//                         ));
// }

    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: 'assests/images/workout.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              // Padding(
              //         padding: EdgeInsets.fromLTRB(30, 30, 30, 30),),
              Flexible(
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 100, 30, 100),
                      child: Container(
                          height: size.height * 0.2,
                          child: Image(
                            image: AssetImage('assests/images/openicon.png'),
                          ))),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    control: emails,
                    icon: Icons.account_circle,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    data: map[emails],
                  ),
                  PasswordInput(
                    cont: passwords,
                    icon: Icons.lock,
                    hint: 'Password',
                    datap: map[passwords],
                    // inputType: TextInputType.,

                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: Text(
                      'Forgot Password',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff23395d),
                    ),
                    child: FlatButton(
                      onPressed: onlogin,
                      //   LoginRequestModel requestModel = LoginRequestModel(
                      //       email: emails as String,
                      //       password: passwords as String);
                      //   Auth auth = new Auth();
                      //   auth.login(requestModel);
                      // },
                      child: Text(
                        'Login',
                        style: kSideText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              // GestureDetector(
              //   onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
              //   child: Container(
              //     child: Text(
              //       'Create New Account',
              //       style: kBodyText,
              //     ),
              //     decoration: BoxDecoration(
              //         border:
              //             Border(bottom: BorderSide(width: 1, color: kWhite))),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
