import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/screens/custom_web_view.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/pages/main_view.dart';
import 'base_route_animation.dart';
import 'routes_app_const.dart';
import '../../featuers/admin/categories/presentation/pages/add_category_screen.dart';
import '../../featuers/admin/homeAdmin/presentation/pages/home_admin_view.dart';
import '../../featuers/auth/login/presentation/bloc/login_bloc.dart';
import '../../featuers/auth/login/presentation/pages/login_view.dart';
import '../../featuers/auth/signup/presentation/pages/sign_up_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutingApp {
  static Route? onGenerate(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;
    switch (settings.name) {
      case RoutesAppConst.logIn:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginView(),
        ));
      case RoutesAppConst.signUp:
        return BaseRoute(page: const SignUpView());
      case RoutesAppConst.homeAdmin:
        return BaseRoute(page: const HomeAdminView());
      case RoutesAppConst.creatCategory:
        return BaseRoute(page: const AddCategoryScreen());
      case RoutesAppConst.mainScreenUser:
        return BaseRoute(page: const MainScreenView());
      case RoutesAppConst.webView:
        return BaseRoute(page:  CustomWebView(url: args as String,));
    }
    return null;
  }
}
