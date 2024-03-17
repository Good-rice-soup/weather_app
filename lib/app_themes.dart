import 'package:flutter/material.dart';

class AppThemes {
  static ColorScheme getColorScheme({required int time}) {
    switch (time) {
      case 0:
        return ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.light,
          surface: const Color(0xFFA3DAFF),
        );

      case 1:
        return ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
          surface: Colors.blue[400],
        );

      case 2:
        return ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
          surface: Colors.deepPurple[400],
        );

      case 3:
        return ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.light,
          surface: const Color(0xFF707287),
        );

      default:
        return ColorScheme.fromSeed(
          seedColor: Colors.white60,
          brightness: Brightness.light,
          surface: Colors.white60,
        );
    }
  }

}
