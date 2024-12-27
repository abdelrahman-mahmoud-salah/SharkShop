import 'package:flutter/material.dart';
import 'core/app/bloc_observer.dart';
import 'core/app/Appcubit/app_cubit.dart';
import 'core/app/Appcubit/app_state.dart';
import 'core/di/dependency_injection.dart';
import 'core/routes/routes_app_const.dart';
import 'core/routes/routing_app.dart';
import 'core/styles/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupInjector();
  Bloc.observer = AppBlocObserver();
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<AppCubit>()..checkConectivity(),
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
              final cubit = context.read<AppCubit>();

              return changeThemeAndLocal(state, cubit);
            })));
  }
}

MaterialApp changeThemeAndLocal(AppState state, AppCubit cubit) {
  if (state ==
      state.copywith(
        statesApp: StatesApp.changeThemeMode,
      )) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teck Teck',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(cubit.loca!),
      theme: cubit.theme == 'dark' ? themeDark() : themeLight(),
      onGenerateRoute: RoutingApp.onGenerate,
      initialRoute: RoutesAppConst.mainScreenUser,
      navigatorKey: sl<GlobalKey<NavigatorState>>(),
    );
  } else if (state ==
      state.copywith(
        statesApp: StatesApp.changeLocalization,
      )) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teck Teck',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(cubit.loca!),
      theme: cubit.theme == 'dark' ? themeDark() : themeLight(),
      onGenerateRoute: RoutingApp.onGenerate,
      initialRoute: RoutesAppConst.mainScreenUser,
      navigatorKey: sl<GlobalKey<NavigatorState>>(),
    );
  } else {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teck Teck',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(cubit.loca!),
      theme: cubit.theme == 'dark' ? themeDark() : themeLight(),
      onGenerateRoute: RoutingApp.onGenerate,
      initialRoute: RoutesAppConst.mainScreenUser,
      navigatorKey: sl<GlobalKey<NavigatorState>>(),
    );
  }
}
