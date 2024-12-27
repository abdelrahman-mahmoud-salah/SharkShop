import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/core/services/api_services.dart';
import 'package:flutter_application_2/featuers/custom/profile/data/data_sources/remote/user_info/user_info_remote.dart';
import 'package:flutter_application_2/featuers/custom/profile/data/models/user_info_model_repo.dart';

class UserInfoRemoteImpl implements UserInfoRemote {
  final ApiManager _apiManager;
  const UserInfoRemoteImpl(this._apiManager);
  @override
  Future<ApiResult<UserInfoModelRepo>> userInfo() async {
    try {
      var userInfo = await _apiManager.userInfo();
      return ApiResult.success(userInfo);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
