import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'Roboto',
   primaryColor: Color(0xFF2D2D2D),
  // primaryColor: Colors.green,
  secondaryHeaderColor: Color(0xFF1988FF),
  //disabledColor: Color(0xFFBABFC4),
  disabledColor: Color(0xFF000000),
  backgroundColor: Color(0xFFF3F3F3),
  errorColor: Color(0xFFE84D4F),
  brightness: Brightness.light,
  hintColor: Color(0xFF9F9F9F),
  cardColor: Colors.white,
appBarTheme: AppBarTheme(color: Colors.green),
iconTheme: IconThemeData(color: Colors.green),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.green,
    ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Color(0xFF00A468))), colorScheme: ColorScheme.light(primary: Color(0xFF1988FF)).copyWith(secondary: Color(0xFF1988FF)),
);

var iconColor = Colors.green;
var btntext = Colors.white;
var appbarclr = Colors.white;
var appbartxtclr = Colors.black;