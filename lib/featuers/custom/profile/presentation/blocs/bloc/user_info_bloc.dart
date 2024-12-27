import 'dart:async';
import 'package:flutter_application_2/featuers/custom/profile/domain/use_cases/user_info/user_info_use_case.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/blocs/bloc/user_info_event.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/blocs/bloc/user_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoBloc extends Bloc<UserEvent, UserInfoState> {
  UserInfoBloc(this._userInfoUseCase) : super(const UserInfoState()) {
    on<UserInfoEvent>(userInfo);
  }
  final UserInfoUseCase _userInfoUseCase;
  FutureOr<void> userInfo(UserInfoEvent event, emit) async {
    emit(const UserInfoState().copyWith(status: UserInfoStatus.loading));
    var userInfo = await _userInfoUseCase.call();
    userInfo.when(
      success: (data) {
        emit(const UserInfoState()
            .copyWith(status: UserInfoStatus.loaded, userInfo: data));
      },
      failure: (errorHandler) {
        emit(const UserInfoState().copyWith(status: UserInfoStatus.error));
      },
    );
  }
}
