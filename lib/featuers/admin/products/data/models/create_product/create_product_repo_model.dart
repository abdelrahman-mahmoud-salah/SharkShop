import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_product_repo_model.g.dart';

@JsonSerializable()
class CreateProductRepoModel {
  final String? title;
  final String? description;
  final List<String>? images;
  final int? price;
  final int? categoryId;
  final CategoryProduct? categoryProduct;
  CreateProductRepoModel(
      {this.title,
      this.description,
      this.images,
      this.price,
      this.categoryId,
      this.categoryProduct});
  factory CreateProductRepoModel.fromJson(Map<String, dynamic> json) =>
      _$CreateProductRepoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductRepoModelToJson(this);
}

@JsonSerializable()
class CategoryProduct {
  final int id;
  final String? name;
  final String? image;
  CategoryProduct({required this.id, this.name, this.image});
  factory CategoryProduct.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductToJson(this);
}
