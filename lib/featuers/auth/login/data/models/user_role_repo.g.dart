// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRoleResponse _$UserRoleResponseFromJson(Map<String, dynamic> json) =>
    UserRoleResponse(
      json['role'] as String?,
      (json['id'] as num?)?.toInt(),
      json['email'] as String?,
      json['name'] as String?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$UserRoleResponseToJson(UserRoleResponse instance) =>
    <String, dynamic>{
      'role': instance.userRole,
      'id': instance.userId,
      'name': instance.userName,
      'email': instance.userEmail,
      'avatar': instance.userImage,
    };
