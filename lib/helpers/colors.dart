import 'package:flutter/material.dart';

class GlobalColors {
  static Color primary = const Color(0xff1c68fb);
  static Color ashWhite = const Color(0xfff0f3f5);
  static Color inputField = const Color(0xff1f1f1f);
  static Color card = const Color(0xff252a34);

  static const MaterialColor materialPrimaryColor = MaterialColor(
    0xff1C68FB, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff1C68FB), //10%
      100: Color(0xff195ee2), //20%
      200: Color(0xff1653c9), //30%
      300: Color(0xff1449b0), //40%
      400: Color(0xff113e97), //50%
      500: Color(0xff0e347e), //60%
      600: Color(0xff0b2a64), //70%
      700: Color(0xff081f4b), //80%
      800: Color(0xff061532), //90%
      900: Color(0xff030a19), //100%
    },
  );
}
