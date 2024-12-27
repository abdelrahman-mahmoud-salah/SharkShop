// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModelRepo _$UserInfoModelRepoFromJson(Map<String, dynamic> json) =>
    UserInfoModelRepo(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      avatar: json['avatar'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserInfoModelRepoToJson(UserInfoModelRepo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
      'role': instance.role,
    };
