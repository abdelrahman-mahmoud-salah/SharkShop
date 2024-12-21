// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProductRequestModel _$UpdateProductRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProductRequestModel(
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UpdateProductRequestModelToJson(
        UpdateProductRequestModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'images': instance.images,
    };
