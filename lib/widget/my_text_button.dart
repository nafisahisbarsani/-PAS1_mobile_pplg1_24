import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  const MyTextButton({super.key, required this.text, required this.onPressed, required this.textColor, required this.fontSize, required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        ));
  }
}
