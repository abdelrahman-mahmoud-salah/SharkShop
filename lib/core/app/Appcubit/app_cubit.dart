// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app/Appcubit/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppStateInitial());
  StreamSubscription? streamSubscription;
  bool dark = true;
  bool english = true;
  bool connected = true;
  String? loca="en";
  String? theme="dark";
  void changetheme() {
    // ignore: unused_local_variable

    dark = !dark;
    if (dark == true) {
      theme = 'dark';
      emit(state.copywith(
          statesApp: StatesApp.changeThemeMode, thememode: 'dark'));
    } else {
      theme = 'light';
      emit(state.copywith(
          statesApp: StatesApp.changeThemeMode, thememode: 'light'));
    }
    debugPrint(theme);
  }

  void changelocalization() {
    english = !english;
    if (english == true) {
      loca = "en";
      emit(state.copywith(
          statesApp: StatesApp.changeLocalization, localization: loca));
    } else {
      loca = 'ar';
      emit(state.copywith(
          statesApp: StatesApp.changeLocalization, localization: loca));
    }
    debugPrint(loca);
  }

  void checkConectivity() {
    streamSubscription = Connectivity().onConnectivityChanged.listen(
      (event) {
        // ignore:
        if (event == ConnectivityResult.mobile ||
            event == ConnectivityResult.wifi) {
              connected=true;
          emit(state.copywith(
              statesApp: StatesApp.checkConectivityNetworking,
              connected: "connected"));
          debugPrint("connected");
        } else {
          connected=false;
          emit(state.copywith(
              statesApp: StatesApp.checkConectivityNetworking,
              connected: "not connected"));
          debugPrint("not connected");
        }
      },
    );
  }
}
