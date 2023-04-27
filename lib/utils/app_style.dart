import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  static  TextStyle h1Text = TextStyle(
    fontSize: 24.sp,
    color: const Color(0xff212121),
  );

  /// ************************************************************
  static  TextStyle h2Text = TextStyle(
    fontSize: 20.sp,
    color: const Color(0xff212121),
  );

  /// ************************************************************

  static  TextStyle h3Text = TextStyle(
    fontSize: 18.sp,
    color: const Color(0xff666666),
  );

  /// ************************************************************

  static  TextStyle h4Text = TextStyle(
    fontSize: 15.sp,
    color: const Color(0xff212121),
  );

  /// ************************************************************

  static  TextStyle h5Text = TextStyle(
    fontSize: 15.sp,
    color: const Color(0xff666666),
  );

  /// ************************************************************
}
