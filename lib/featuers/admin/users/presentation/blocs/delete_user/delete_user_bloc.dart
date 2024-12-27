import 'dart:async';
import 'package:flutter_application_2/featuers/admin/users/domain/use_cases/delete_user/delete_user_use_case.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/delete_user/delete_user_event.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/delete_user/delete_user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteUserBloc extends Bloc<UserEvent, DeleteUserState> {
  DeleteUserBloc({
    required this.deleteUserUseCase,
  }) : super(const DeleteUserState()) {
    on<DeleteUserEvent>(DeleteUser);
  }

  final DeleteUserUseCase deleteUserUseCase;
  // ignore: non_constant_identifier_names
  FutureOr<void> DeleteUser(DeleteUserEvent event, emit) async {
    emit(state.copyWith(state: DeleteUserStatevalue.loading));

    var result = await deleteUserUseCase.call(event.userId);
    result.when(
      success: (data) {
        emit(state.copyWith(
            state: DeleteUserStatevalue.success, iduser: event.userId));
      },
      failure: (errorHandler) {
        emit(state.copyWith(state: DeleteUserStatevalue.error));
      },
    );
  }
}
