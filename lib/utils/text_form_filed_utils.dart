import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/widgets/auth/outline_border_widget.dart';
import '../view/widgets/auth/prefix_from_filed_widget.dart';

// ignore: must_be_immutable
class TextFormFiledUtils extends StatelessWidget {
  final String imageString, hintText;
  final TextInputType keyboardType;
  final Widget suffixIcon;
  final Function(dynamic value) validator;
  final bool obscureText;
  final TextEditingController controller;
  const TextFormFiledUtils({
    super.key,
    required this.imageString,
    required this.hintText,
    required this.keyboardType,
    required this.validator,
    required this.obscureText,
    required this.suffixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: TextFormFieldWidget(),
          focusedBorder: TextFormFieldWidget(),
          errorBorder: TextFormFieldWidget(),
          border: TextFormFieldWidget(),
          prefixIcon: prefixFromFiledWidget(
            imageStringPrefix: imageString,
            color: context.theme.primaryColor,
          ),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        keyboardType: keyboardType,
        validator: (value) => validator(value),
        controller: controller,
        obscureText: obscureText,
      ),
    );
  }
}
