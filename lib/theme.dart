
import 'package:flutter/material.dart';

class ThemeProvider {
  static ThemeData themeData = ThemeData(
    fontFamily: "Nunito",
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
      headline1: TextStyle(),
      headline2: TextStyle(),
    ).apply(
      bodyColor: darkBlue,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent
    )
  );

  // Colors
  static Color lightBlue = Color(0xff677798);
  static Color blue = Color(0xff244875);
  static Color darkBlue = Color(0xff2B2D3A);
  static Color green = Color(0xff4FBA5D);
  static Color beige = Color(0xffE2D3C5);
  static Color red = Color(0xffCD0118);

  // Dimensions
  static double horizontalPadding = 16;
}