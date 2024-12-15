import 'package:json_annotation/json_annotation.dart';

part 'product_repo_model.g.dart';



@JsonSerializable()
class ProductRepoModel {
  final int id;
  final String? title;
  final int? price;
  final String? description;
  final List<String>? images;
  
  final Category? category;

  ProductRepoModel({
    required this.id,
  this.title,
   this.price,
     this.description,
    this.images,
   
    this.category,
  });

  factory ProductRepoModel.fromJson(Map<String, dynamic> json) =>
      _$ProductRepoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRepoModelToJson(this);
}

@JsonSerializable()
class Category {
  final int id;
  final String? name;
  final String? image;
  

  Category({
    required this.id,
     this.name,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
