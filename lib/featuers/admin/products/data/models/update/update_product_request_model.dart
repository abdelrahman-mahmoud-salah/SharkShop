import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_product_request_model.g.dart';

@JsonSerializable()
class UpdateProductRequestModel {
  final String? title;
  final String? description;
  final int? price;
  final List<String>? images;
  UpdateProductRequestModel(
      {this.title, this.price, this.images, this.description});
  factory UpdateProductRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductRequestModelToJson(this);
}
