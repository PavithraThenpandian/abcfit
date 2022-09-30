import 'package:flutter/material.dart';
import './/pallete.dart';

class TextInputField extends StatelessWidget {
  TextInputField({
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.control,
    required this.data,
  });
  final TextEditingController control;
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final data;

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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Vaild email';
              }
            },
            onSaved: (value) {
              value = data;
            },
            onChanged: (text) {},
            controller: control,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: kWhite,
                ),
              ),
              hintText: hint,
              hintStyle: kSideText,
            ),
            style: kBodyText,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}
