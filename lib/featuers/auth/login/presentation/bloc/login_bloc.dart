import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/services/api_services.dart';
import '../../data/data_sources/remote/remote_ds.dart';
import '../../data/data_sources/remote/remoteds_imple.dart';
import '../../data/models/login_model_request.dart';
import '../../data/repositories_impl/login_repo_imple.dart';
import '../../domain/repositories/login_repo.dart';
import '../../domain/use_cases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<LoginEvent>(login);
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  FutureOr<void> login(LoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoginState().copyWith(screenStatus: LoginStateValue.Loading));
    RemoteLoginDataSource loginDataSource =
        LoogInRemotedsImplementation(sl<ApiService>());
    LoginRepository loginRepository = LoginRepoImple(loginDataSource);
    LoginUseCase _loginUseCase = LoginUseCase(loginRepository);

    var repo = await _loginUseCase.Call(
        SignInRequestModel: LoginRequestModel(
            email: emailController.text, password: passwordController.text));
    repo.when(
      success: (data) {
        emit(
            const LoginState().copyWith(screenStatus: LoginStateValue.success));
      },
      failure: (errorHandler) {
        emit(const LoginState().copyWith(
            screenStatus: LoginStateValue.error, failures: errorHandler));
      },
    );
  }
}
