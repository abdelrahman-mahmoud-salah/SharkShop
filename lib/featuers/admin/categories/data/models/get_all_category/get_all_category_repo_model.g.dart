// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_category_repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoryRepoModel _$GetAllCategoryRepoModelFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoryRepoModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$GetAllCategoryRepoModelToJson(
        GetAllCategoryRepoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
