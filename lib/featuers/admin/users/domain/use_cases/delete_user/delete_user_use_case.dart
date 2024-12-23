import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/repositories/delete_user/delete_user_repo.dart';

class DeleteUserUseCase {
  final DeleteUserRepo _deleteUserRepo;

  DeleteUserUseCase(this._deleteUserRepo);

  Future<ApiResult<void>> call(String userId) =>
      _deleteUserRepo.deleteUser(userId);
}
