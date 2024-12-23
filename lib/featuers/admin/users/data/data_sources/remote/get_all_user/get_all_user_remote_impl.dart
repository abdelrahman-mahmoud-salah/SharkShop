import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/core/services/api_services.dart';
import 'package:flutter_application_2/featuers/admin/users/data/data_sources/remote/get_all_user/get_all_user_remote.dart';
import 'package:flutter_application_2/featuers/admin/users/data/models/get_all_user_repo_model.dart';

class GetAllUserRemoteImpl implements GetAllUserRemote {
  final ApiManager _apiManager;

  GetAllUserRemoteImpl(this._apiManager);
  @override
  Future<ApiResult<List<GetAllUsersRepoModel>>> getAllUser() async {
    try {
      var result = await _apiManager.getAllUser();
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
