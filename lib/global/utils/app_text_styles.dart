import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle luloClean({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    // Add more parameters as needed
  }) {
    return TextStyle(
      fontFamily: 'LuloClean',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle markerFont({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'MarkerFeltNarrow',
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
    );
  }

    static TextStyle ralewayFont({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'Raleway',
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
    );
  }
}
