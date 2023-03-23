import 'package:flutter/material.dart';

class AppTheme{

  static const Color primaryColor = Color.fromRGBO(237, 0, 0, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primaryColor)
    ),

    scaffoldBackgroundColor: const Color.fromRGBO(51, 62, 65, 1),

    iconTheme: const IconThemeData(
      color: primaryColor
    ),

    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: const StadiumBorder(),
        elevation: 0
      )
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primaryColor),
      enabledBorder: OutlineInputBorder(
        borderSide:BorderSide(color: primaryColor),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
      )
    )
  );
 
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,

    iconTheme: const IconThemeData(
      color: primaryColor
    ),
    
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor
    )
  );
}