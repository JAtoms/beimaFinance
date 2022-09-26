import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'size_config.dart';

class GlobalTextStyles {
  static TextStyle regularText({Color? color, double fontSize = 16}) {
    return GoogleFonts.poppins(color: color, fontSize: fontSize);
  }

  static TextStyle medium(
      {Color? color, double fontSize = 16, required BuildContext context}) {
    return GoogleFonts.poppins(
        color: color,
        textStyle: Theme.of(context).textTheme.subtitle1,
        fontSize: fontSize);
  }

  static TextStyle bold(
      {Color? color, double fontSize = 16, required BuildContext context}) {
    return GoogleFonts.poppins(
        color: color,
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: fontSize);
  }

  static TextStyle title(
      {Color? color, Paint? foreground, double fontSize = 60}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: 'Freizeit',
        foreground: foreground,
        fontSize: SizeConfig.textAdjusted(fontSize + 3));
  }
}
