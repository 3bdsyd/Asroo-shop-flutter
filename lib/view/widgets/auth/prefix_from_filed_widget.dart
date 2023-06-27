import 'package:flutter/material.dart';

Widget prefixFromFiledWidget({required String imageStringPrefix, required Color color}) {
  return Container(
    margin: const EdgeInsets.all(5),
    height: 5,
    width: 5,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Image.asset(
      imageStringPrefix,
      color: color,
    ),
  );
}
