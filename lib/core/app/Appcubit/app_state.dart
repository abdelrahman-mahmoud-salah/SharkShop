import 'package:equatable/equatable.dart';

enum StatesApp {
  init,
  changeThemeMode,
  changeLocalization,
  checkConectivityNetworking,
}

class AppState extends Equatable {
  const AppState(
      {this.connected, this.thememode, this.localization, this.statesApp});
  final StatesApp? statesApp;
  final String? thememode;
  final String? localization;
  final String? connected;
  AppState copywith(
      {final StatesApp? statesApp,
      final String? thememode,
      final String? localization,
      final String? connected}) {
    return AppState(
        statesApp: statesApp ?? this.statesApp,
        thememode: thememode ?? this.thememode,
        localization: localization ?? this.localization);
  }

  @override
  List<Object?> get props => [statesApp, thememode, localization, connected];
}

final class AppStateInitial extends AppState {
  const AppStateInitial() : super(statesApp: StatesApp.init);
}
