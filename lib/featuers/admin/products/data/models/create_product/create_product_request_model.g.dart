// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductRequestModel _$CreateProductRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateProductRequestModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: (json['price'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateProductRequestModelToJson(
        CreateProductRequestModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'price': instance.price,
      'categoryId': instance.categoryId,
    };
