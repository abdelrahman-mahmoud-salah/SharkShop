import 'package:flutter_application_2/featuers/admin/users/domain/entities/get_all_user_repo_entities.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_all_user_repo_model.g.dart';

@JsonSerializable()
class GetAllUsersRepoModel extends GetAllUsersRepoModelEntities {
  final String password;

  final String role;
  final String avatar;

 const GetAllUsersRepoModel({
    required this.password,
    required super.id ,
    required super.name,
    required super.email,
    required this.role,
    required this.avatar,
  });

  // Factory for creating a model from JSON
  factory GetAllUsersRepoModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersRepoModelFromJson(json);

  // Method for converting the model to JSON
  Map<String, dynamic> toJson() => _$GetAllUsersRepoModelToJson(this);

  @override
  List<Object?> get props =>
      [password, role, avatar, super.id, super.name, super.email];
}
