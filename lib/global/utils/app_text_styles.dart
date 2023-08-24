import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle luloClean({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    // Add more parameters as needed
  }) {
    return TextStyle(
      fontFamily: 'LuloClean',
      fontSize: fontSize,
      height: height ?? 0,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle markerFont({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontFamily: 'MarkerFeltNarrow',
      fontSize: fontSize ?? 16,
      height: height ?? 0,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
    );
  }

  static TextStyle ralewayFont({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontFamily: 'Raleway',
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: height ?? 0,
      color: color ?? Colors.black,
    );
  }
}
