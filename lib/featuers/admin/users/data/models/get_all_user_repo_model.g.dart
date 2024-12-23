// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_user_repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUsersRepoModel _$GetAllUsersRepoModelFromJson(
        Map<String, dynamic> json) =>
    GetAllUsersRepoModel(
      password: json['password'] as String,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$GetAllUsersRepoModelToJson(
        GetAllUsersRepoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
      'role': instance.role,
      'avatar': instance.avatar,
    };
