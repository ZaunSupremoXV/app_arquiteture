import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final darkMode = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
  );

  static final lightMode = ThemeData(
    accentColor: Color(0xFFF27244),
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
  );

  static final titleAppBar = GoogleFonts.parisienne(
    fontSize: 35,
  );

  static final textBody = GoogleFonts.cinzel(
    fontSize: 15,
  );

  static final textIntro = GoogleFonts.cinzel(fontSize: 20);
}
