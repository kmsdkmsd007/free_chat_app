import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const CustomText({
    super.key,
    required this.text,
    this.color = const Color.fromARGB(255, 31, 65, 187),
    this.size = 14.0,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
