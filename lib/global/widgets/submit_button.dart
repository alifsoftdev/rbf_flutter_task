import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final Color? color;

  const SubmitButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.buttonStyle,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          letterSpacing: 2.0,
          fontFamily: 'Poppins',
          fontSize: 16.sm,
          fontWeight: FontWeight.w500,
          color: Color(0xFF000000)
        ),
      ),
      style: buttonStyle,
    );
  }
}
