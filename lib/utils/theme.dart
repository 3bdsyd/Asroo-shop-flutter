import 'package:flutter/material.dart';

const Color mainColor = Color.fromARGB(255, 36, 177, 187);
const Color darkGreyClr = Colors.black;
const Color pinkClr = Colors.redAccent;
const Color kCOlor1 = Color(0xff685959);
const Color kCOlor2 = Color(0xffADA79B);
const Color kCOlor3 = Color(0xffA5947F);
const Color kCOlor4 = Color(0xff738B71);
const Color kCOlor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

class ThemeApp {
  static final ThemeData dark = ThemeData(
    primaryColor: pinkClr,
    focusColor: pinkClr,
    scaffoldBackgroundColor: darkGreyClr,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(pinkClr),
      ),
    ),
    iconTheme: const IconThemeData(color: pinkClr),
    highlightColor: Colors.white,
    brightness: Brightness.dark,
  );

  static final ThemeData light = ThemeData(
    primaryColor: mainColor,
    focusColor: mainColor,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(mainColor),
      ),
    ),
    iconTheme: const IconThemeData(color: mainColor),
    highlightColor: Colors.black,
    brightness: Brightness.dark,
  );
}
