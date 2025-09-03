import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontUtils {
  static TextStyle getTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.suwannaphum(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle getBoldTextStyle({
    double? fontSize,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.suwannaphum(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
    );
  }

  static TextStyle getRegularTextStyle({
    double? fontSize,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.suwannaphum(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: color,
      height: height,
    );
  }

  static TextStyle getMediumTextStyle({
    double? fontSize,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.suwannaphum(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
    );
  }
}
