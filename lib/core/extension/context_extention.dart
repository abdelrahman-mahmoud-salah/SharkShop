import 'package:flutter/material.dart';
import '../styles/theme/mycolors_extentions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
extension ContextExtention on BuildContext {
  //textstyle
  TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;
  //colors
  MyColors get mycolors => Theme.of(this).extension<MyColors>()!;
  //locatization
  AppLocalizations get lang => AppLocalizations.of(this)!;
  //navigation
  Future<dynamic> pushNamed({required String pageName, Object? arg}) =>
      Navigator.of(this).pushNamed(pageName, arguments: arg);

  Future<dynamic> pushReplacedNamed({required String pageName, Object? arg}) =>
      Navigator.of(this).pushReplacementNamed(pageName, arguments: arg);

  void pop() => Navigator.of(this).pop();
}
