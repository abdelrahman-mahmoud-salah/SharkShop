// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_catecory_model_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCatecoryModelRequest _$CreateCatecoryModelRequestFromJson(
        Map<String, dynamic> json) =>
    CreateCatecoryModelRequest(
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CreateCatecoryModelRequestToJson(
        CreateCatecoryModelRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
