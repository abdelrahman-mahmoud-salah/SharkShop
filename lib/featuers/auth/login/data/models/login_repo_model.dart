import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_repo_model.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class LoginResponseModel extends Equatable {
  LoginResponseModel(this.data);
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  LoginDataModel data;

  @override
  List<Object?> get props => [data];
}

@JsonSerializable()
// ignore: must_be_immutable
class LoginDataModel extends Equatable {
  LoginDataModel(this.login);

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  LoginModel login;

  @override
  
  List<Object?> get props => [login];
}

@JsonSerializable()
class LoginModel extends Equatable {
  const LoginModel({
    this.accessToken,
    this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  @override

  List<Object?> get props => [accessToken, refreshToken];
}
