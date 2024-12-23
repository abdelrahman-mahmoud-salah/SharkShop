import 'package:equatable/equatable.dart';

enum DeleteUserStatevalue { initial, loading, success, error, empty }

class DeleteUserState extends Equatable {
  final DeleteUserStatevalue? state;
  final String? iduser;

  const DeleteUserState(
      {this.state = DeleteUserStatevalue.initial, this.iduser});

  DeleteUserState copyWith({
    DeleteUserStatevalue? state,
    String? iduser,
  }) =>
      DeleteUserState(
        iduser: iduser ?? this.iduser,
        state: state ?? this.state,
      );

  @override
  List<Object?> get props => [state, iduser];
}
