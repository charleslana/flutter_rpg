import 'package:flutter/material.dart';

class ThemeConstant {
  ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Dosis',
    scaffoldBackgroundColor: Colors.black,
    colorScheme:
        const ColorScheme.dark().copyWith(primary: const Color(0xff745bbb)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff745bbb),
      selectedItemColor: Colors.white,
    ),
    tabBarTheme: const TabBarTheme(
      indicator: ShapeDecoration(
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
      ),
      labelColor: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: Color(0xff352d5b),
    ),
  );
}
