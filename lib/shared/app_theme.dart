// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0XFF39A552);
  static const Color navy = Color(0XFF4F5A69);
  static const Color grey = Color(0XFF79828B);

  static const Color black = Color(0XFF303030);
  static const Color white = Color(0XFFFFFFFF);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: white,
      titleTextStyle:
          TextStyle(color: white, fontSize: 22, fontWeight: FontWeight.w400),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(32),
          right: Radius.circular(32),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      titleLarge:
          TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: white),
      titleSmall:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black),
    ),
  );
}
