import 'package:json_annotation/json_annotation.dart';
part 'get_all_category_repo_model.g.dart';

@JsonSerializable()
class GetAllCategoryRepoModel {
  final int id;
  final String? name;
  final String? image;
  GetAllCategoryRepoModel({
    required this.id,
    this.name,
    this.image,
  });

  factory GetAllCategoryRepoModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoryRepoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCategoryRepoModelToJson(this);
}
