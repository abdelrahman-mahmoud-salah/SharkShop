import 'package:flutter/material.dart';
import '../colors/dark_color.dart';
import '../colors/light_color.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.mainColor,
    required this.bluePinkDark,
    required this.bluePinkLight,
    required this.textColorInButton,
    required this.textFormBorder,
    required this.navBarbg,
    required this.navBarSelectedTab,
    required this.containerShadow1,
    required this.containerShadow2,
    required this.containerLinear1,
    required this.containerLinear2,
    required this.textcolor,
  });

  final Color? mainColor;
  final Color? bluePinkDark;
  final Color? bluePinkLight;
  final Color? textColorInButton;
  final Color? textFormBorder;
  final Color? navBarbg;
  final Color? navBarSelectedTab;
  final Color? containerShadow1;
  final Color? containerShadow2;
  final Color? containerLinear1;
  final Color? containerLinear2;
  final Color? textcolor;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? mainColor,
    Color? bluePinkDark,
    Color? bluePinkLight,
    Color? textColor,
    Color? textFormBorder,
    Color? navBarbg,
    Color? navBarSelectedTab,
    Color? containerShadow1,
    Color? containerShadow2,
    Color? containerLinear1,
    Color? textcolor,
  }) {
    return MyColors(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
      bluePinkLight: bluePinkLight,
      textColorInButton: textColorInButton,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
      textcolor: textcolor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
      covariant ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
      bluePinkLight: bluePinkLight,
      textColorInButton: textColorInButton,
      textcolor: textcolor,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
    );
  }

  static const MyColors dark = MyColors(
    mainColor: ColorsDark.mainColor,
    bluePinkDark: ColorsDark.blueDark,
    bluePinkLight: Color.fromARGB(255, 5, 179, 248),
    textColorInButton: ColorsDark.white,
    textcolor: ColorsDark.white,
    textFormBorder: ColorsDark.blueLight,
    navBarbg: ColorsDark.navBarDark,
    navBarSelectedTab: ColorsDark.white,
    containerShadow1: ColorsDark.black1,
    containerShadow2: ColorsDark.black2,
    containerLinear1: ColorsDark.black1,
    containerLinear2: ColorsDark.black2,
  );
  static const MyColors light = MyColors(
    mainColor: ColorsLight.mainColor,
    bluePinkDark: ColorsLight.pinkDark,
    bluePinkLight: ColorsLight.pinkLight,
    textcolor: ColorsLight.pinkDark,
    textColorInButton: Color.fromARGB(255, 245, 244, 244),
    textFormBorder: ColorsLight.pinkLight,
    navBarbg: ColorsLight.mainColor,
    navBarSelectedTab: ColorsLight.pinkDark,
    containerShadow1: ColorsLight.white,
    containerShadow2: ColorsLight.white,
    containerLinear1: ColorsLight.pinkDark,
    containerLinear2: ColorsLight.pinkLight,
  );
}
