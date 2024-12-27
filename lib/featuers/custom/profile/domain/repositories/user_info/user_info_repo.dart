import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/custom/profile/data/models/user_info_model_repo.dart';

abstract class UserInfoRepo {
 Future<ApiResult< UserInfoModelRepo>> userInfo();
}
