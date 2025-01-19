import 'package:flutter/widgets.dart';


import 'package:flutter_application_2/core/di/dependency_injection.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/core/routes/routes_app_const.dart';

class AppLogout {
  factory AppLogout() {
    return _instance;
  }

  AppLogout._();

  static final AppLogout _instance = AppLogout._();

  Future<void> logout() async {
    final context = sl<GlobalKey<NavigatorState>>().currentState!.context;
    // await SharedPref().removePreference(PrefKeys.accessToken);
    // await SharedPref().removePreference(PrefKeys.userId);
    // await SharedPref().removePreference(PrefKeys.userRole);
    // await HiveDatabase().clearAllBox();
    // if (!context.mounted) return;
    context.pushNamedAndRemoveUntil(pageName: RoutesAppConst.logIn);
  }
}
