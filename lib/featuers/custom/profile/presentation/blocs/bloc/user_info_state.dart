import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/featuers/custom/profile/data/models/user_info_model_repo.dart';

enum UserInfoStatus { initial, loading, loaded, error }

class UserInfoState extends Equatable {
  final UserInfoStatus? status;
  final UserInfoModelRepo? userInfo;

  const UserInfoState({
    this.status = UserInfoStatus.initial,
    this.userInfo,
  });

  UserInfoState copyWith({
    UserInfoStatus? status,
    UserInfoModelRepo? userInfo,
  }) =>
      UserInfoState(
        status: status ?? this.status,
        userInfo: userInfo ?? this.userInfo,
      );

  @override
  List<Object?> get props => [status, userInfo];
}
