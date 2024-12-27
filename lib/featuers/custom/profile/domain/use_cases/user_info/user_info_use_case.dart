import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/custom/profile/data/models/user_info_model_repo.dart';
import 'package:flutter_application_2/featuers/custom/profile/domain/repositories/user_info/user_info_repo.dart';

class UserInfoUseCase {
  final UserInfoRepo _userInfoRepo;
  const UserInfoUseCase(this._userInfoRepo);
  Future<ApiResult< UserInfoModelRepo>> call() => _userInfoRepo.userInfo();
}
