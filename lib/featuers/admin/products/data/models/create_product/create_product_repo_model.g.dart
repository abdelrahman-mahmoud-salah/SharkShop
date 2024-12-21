// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductRepoModel _$CreateProductRepoModelFromJson(
        Map<String, dynamic> json) =>
    CreateProductRepoModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: (json['price'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      categoryProduct: json['categoryProduct'] == null
          ? null
          : CategoryProduct.fromJson(
              json['categoryProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProductRepoModelToJson(
        CreateProductRepoModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'price': instance.price,
      'categoryId': instance.categoryId,
      'categoryProduct': instance.categoryProduct,
    };

CategoryProduct _$CategoryProductFromJson(Map<String, dynamic> json) =>
    CategoryProduct(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoryProductToJson(CategoryProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
