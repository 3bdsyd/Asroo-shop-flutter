import 'package:asroo_shop/utils/text_utils.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Function() onPressed;
  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextUtils(
        text: text,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: fontSize,
        decoration: TextDecoration.none,
        textAlign: TextAlign.center,
      ),
    );
  }
}
