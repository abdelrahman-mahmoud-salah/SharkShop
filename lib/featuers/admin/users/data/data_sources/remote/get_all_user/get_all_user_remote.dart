import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/users/data/models/get_all_user_repo_model.dart';

abstract class GetAllUserRemote {
  Future<ApiResult<List<GetAllUsersRepoModel>>> getAllUser();
}
