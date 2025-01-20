import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backcolor;
  final double height;
  final double width;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.textColor = const Color.fromARGB(255, 255, 255, 255),
      this.backcolor = const Color.fromARGB(255, 31, 65, 187),
      this.height = 60,
      this.width = 150});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backcolor, borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backcolor,
          foregroundColor: textColor,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
