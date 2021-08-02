import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateNotifierProvider((ref) => ThemeState());

final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    scaffoldBackgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    fontFamily: 'Poppins',
    buttonColor: const Color(0xFF1814E4),
  appBarTheme: AppBarTheme(color: Color(0xFF212121))
);

final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    scaffoldBackgroundColor: Colors.white,
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    fontFamily: 'Poppins',
    buttonColor: const Color(0xFFFA7F35),
    appBarTheme: AppBarTheme(color: Colors.white)
);

class ThemeState extends StateNotifier<ThemeData>{
  ThemeState() : super(lightTheme);

  void setDark(){
    state = darkTheme;
  }

  void setLight(){
    state = lightTheme;
  }
}