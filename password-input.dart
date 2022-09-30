import 'package:flutter/material.dart';
import './/pallete.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput(
      {required this.icon,
      required this.hint,
      // required this.inputType,
      required this.inputAction,
      required this.cont,
      required this.datap});
  final IconData icon;
  final String hint;

  final TextInputAction inputAction;
  final TextEditingController cont;
  final datap;

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscuretxt = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(
            controller: widget.cont,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Vaild email';
              }
            },
            onSaved: (value) {
              value = widget.datap;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  widget.icon,
                  size: 28,
                  color: kWhite,
                ),
              ),
              hintText: widget.hint,
              hintStyle: kSideText,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscuretxt = !_obscuretxt;
                    });
                  },
                  color: kWhite,
                  icon: Icon(_obscuretxt
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined)),
            ),

            obscureText: _obscuretxt,
            style: kBodyText,
            // keyboardType: inputType,
            textInputAction: widget.inputAction,
          ),
        ),
      ),
    );
  }
}
