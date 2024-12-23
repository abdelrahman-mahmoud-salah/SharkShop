// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_user_repo_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUsersRepoModelEntities _$GetAllUsersRepoModelEntitiesFromJson(
        Map<String, dynamic> json) =>
    GetAllUsersRepoModelEntities(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$GetAllUsersRepoModelEntitiesToJson(
        GetAllUsersRepoModelEntities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
    };
