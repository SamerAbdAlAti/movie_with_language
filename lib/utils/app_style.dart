import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  AppStyle._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.cairo().fontFamily,
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData();

  /// ################################################################
  ///
  static const TextStyle h1Text = TextStyle(
    fontSize: 24,
    color: Color(0xff212121),
  );

  /// ************************************************************
  static const TextStyle h2Text = TextStyle(
    fontSize: 20,
    color: Color(0xff212121),
  );

  /// ************************************************************

  static const TextStyle h3Text = TextStyle(
    fontSize: 18,
    color: Color(0xff666666),
  );

  /// ************************************************************

  static const TextStyle h4Text = TextStyle(
    fontSize: 15,
    color: Color(0xff212121),
  );

  /// ************************************************************

  static const TextStyle h5Text = TextStyle(
    fontSize: 15,
    color: Color(0xff666666),
  );

  /// ************************************************************
}
