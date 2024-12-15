import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_category_model_repo.g.dart';
@JsonSerializable()
class CreateCategoryModelRepo {
  final int? id;
  final String? name;
  final String? image;
  CreateCategoryModelRepo(
    {this.id, this.name, this.image,});
    factory CreateCategoryModelRepo.fromJson(Map<String, dynamic> json) => _$CreateCategoryModelRepoFromJson(json);
    Map<String, dynamic> toJson() => _$CreateCategoryModelRepoToJson(this);
}
