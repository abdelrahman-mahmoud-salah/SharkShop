// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_model_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryModelRepo _$CreateCategoryModelRepoFromJson(
        Map<String, dynamic> json) =>
    CreateCategoryModelRepo(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CreateCategoryModelRepoToJson(
        CreateCategoryModelRepo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
