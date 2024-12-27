import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/custom/profile/data/data_sources/remote/user_info/user_info_remote.dart';
import 'package:flutter_application_2/featuers/custom/profile/data/models/user_info_model_repo.dart';
import 'package:flutter_application_2/featuers/custom/profile/domain/repositories/user_info/user_info_repo.dart';

class UserInfoRepoImpl implements UserInfoRepo {
  final UserInfoRemote _userInfoRemote;
  const UserInfoRepoImpl(this._userInfoRemote);
  @override
  Future<ApiResult<UserInfoModelRepo>> userInfo() => _userInfoRemote.userInfo();
}
