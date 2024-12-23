import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/users/data/data_sources/remote/delete_user/delete_user_remote.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/repositories/delete_user/delete_user_repo.dart';

class DeleteUserRepoImpl implements DeleteUserRepo {
  final DeleteUserRemote _deleteUserRemote;

  DeleteUserRepoImpl(this._deleteUserRemote);
  @override
  Future<ApiResult<void>> deleteUser(String id) =>
      _deleteUserRemote.deleteUser(id);
}
