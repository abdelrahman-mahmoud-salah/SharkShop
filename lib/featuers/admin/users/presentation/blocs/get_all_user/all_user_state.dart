import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/entities/get_all_user_repo_entities.dart';

enum AllUserStatevalue { initial, loading, success, error, empty ,search}

class AllUserState extends Equatable {
  final AllUserStatevalue? state;
  final List< GetAllUsersRepoModelEntities>? model;
  final String? iduser;

  const AllUserState(
      {this.state = AllUserStatevalue.initial, this.model, this.iduser});

  AllUserState copyWith({
    AllUserStatevalue? state,
   List< GetAllUsersRepoModelEntities>?model,
    String? iduser,
  }) =>
      AllUserState(
        iduser: iduser ?? this.iduser,
        state: state ?? this.state,
        model: model ?? this.model,
      );

  @override
  List<Object?> get props => [state, model, iduser];
}
