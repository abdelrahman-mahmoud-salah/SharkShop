import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_product_request_model.g.dart';

@JsonSerializable()
class CreateProductRequestModel {
  final String? title;
  final String? description;
  final List<String>? images;
  final int? price;
  final int? categoryId;

  CreateProductRequestModel(
      {this.title, this.description, this.images, this.price, this.categoryId});
  factory CreateProductRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateProductRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductRequestModelToJson(this);
}
