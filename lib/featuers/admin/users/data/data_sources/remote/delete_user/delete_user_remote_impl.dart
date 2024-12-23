import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/core/services/api_services.dart';
import 'package:flutter_application_2/core/services/graphql/admin/user/delete_user.dart';
import 'package:flutter_application_2/featuers/admin/users/data/data_sources/remote/delete_user/delete_user_remote.dart';

class DeleteUserRemoteImpl implements DeleteUserRemote {
  final ApiService _apiService;

  DeleteUserRemoteImpl(this._apiService);

  @override
  Future<ApiResult<void>> deleteUser(String id) async {
    try {
      var user =
          await _apiService.deleteUser(DeleteUser().deleteMapQuery(userId: id));

      return ApiResult.success(user);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
