import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 40, right: 40, bottom: 16),
      child: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                cursorHeight: 28,
                obscureText: obscureText,
                validator: validator,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide(
                      width: 3,
                      color: const Color.fromARGB(255, 221, 222, 223),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: BorderSide(
                        color: Colors.red,
                      )),
                  hintText: hintText,
                  filled: true,
                  fillColor: Color.fromARGB(207, 252, 251, 251),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
