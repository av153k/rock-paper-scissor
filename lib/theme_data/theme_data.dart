import 'package:flutter/material.dart';

darkTheme(context) {
  return ThemeData(
    fontFamily: 'Comfortaa',
    primarySwatch: Colors.blue,
    primaryColor: Color(0xff1b262c),
    accentColor: Color(0xff4ecca3),
    disabledColor: Colors.grey,
    cardColor: Color(0xff393e46),
    canvasColor: Color(0xff232931),
    brightness: Brightness.dark,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: ColorScheme.dark(),
        buttonColor: Color(0xff4ecca3),
        splashColor: Colors.black),
    appBarTheme: AppBarTheme(
      color: Color(0xff232931),
      elevation: 0.0,
    ),
  );
}

lightTheme(context) {
  return ThemeData(
    fontFamily: 'Comfortaa',
    primarySwatch: Colors.blue,
    primaryColor: Color(0xffeeeeee),
    accentColor: Colors.blue,
    disabledColor: Colors.grey,
    cardColor: Colors.white,
    canvasColor: Colors.white,
    brightness: Brightness.light,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: ColorScheme.light(),
        buttonColor: Colors.blue,
        splashColor: Colors.white),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
    ),
  );
}
