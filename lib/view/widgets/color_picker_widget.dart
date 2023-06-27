import 'package:flutter/material.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget(
      {super.key, required this.color, required this.border});
  final Color color;
  final bool border;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          border: border
              ? Border.all(color: Colors.black, width: 2)
              : null,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
