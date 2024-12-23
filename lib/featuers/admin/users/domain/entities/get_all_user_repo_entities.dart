import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_all_user_repo_entities.g.dart';

@JsonSerializable()
class GetAllUsersRepoModelEntities extends Equatable  {
  final int id;
  final String email;

  final String name;

  const GetAllUsersRepoModelEntities({
    required this.id,
    required this.email,
    required this.name,
  });

  // Factory for creating a model from JSON
  factory GetAllUsersRepoModelEntities.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersRepoModelEntitiesFromJson(json);

  // Method for converting the model to JSON
  Map<String, dynamic> toJson() => _$GetAllUsersRepoModelEntitiesToJson(this);

  @override
  List<Object?> get props => [
        id,
        email,
        name,
      ];
}
