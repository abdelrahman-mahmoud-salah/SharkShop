// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      LoginDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) =>
    LoginDataModel(
      LoginModel.fromJson(json['login'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginDataModelToJson(LoginDataModel instance) =>
    <String, dynamic>{
      'login': instance.login,
    };

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
