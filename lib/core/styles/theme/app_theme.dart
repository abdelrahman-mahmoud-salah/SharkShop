import 'package:flutter/material.dart';
import '../colors/dark_color.dart';
import '../colors/light_color.dart';
import '../fonts/font_family.dart';
import 'mycolors_extentions.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark],
    textTheme: TextTheme(
        displaySmall: TextStyle(
      fontSize: 14.0,
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
    )),
  );
}

ThemeData themeLight() {
  return ThemeData(
      scaffoldBackgroundColor: ColorsLight.mainColor,
      extensions: const <ThemeExtension<dynamic>>[MyColors.light],
       textTheme: TextTheme(
        displaySmall: TextStyle(
      fontSize: 14.0,
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
    )),
      );
      
      
}
