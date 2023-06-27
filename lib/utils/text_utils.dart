import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final TextDecoration decoration;
  final TextAlign textAlign;
  const TextUtils({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.color,
    required this.fontSize,
    required this.decoration, required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
        decoration: decoration,
      ),
      textAlign: textAlign,
      softWrap: true,
    );
  }
}
