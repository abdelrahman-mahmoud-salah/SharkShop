import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_info_model_repo.g.dart';

@JsonSerializable()
class UserInfoModelRepo extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? avatar;
  final String? role;

  const UserInfoModelRepo(
      {this.id, this.name, this.email, this.password, this.avatar, this.role});

  factory UserInfoModelRepo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelRepoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoModelRepoToJson(this);

  @override
  List<Object?> get props => [id, name, email, password, avatar, role];
}
