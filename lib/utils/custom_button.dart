import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
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
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: widget.backcolor, borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Text(
            widget.text,
            style: TextStyle(color: widget.textColor, fontSize: 22),
          ))),
    );
  }
}
