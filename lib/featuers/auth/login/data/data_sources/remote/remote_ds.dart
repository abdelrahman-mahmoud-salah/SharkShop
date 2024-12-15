import '../../../../../../core/services/api_error_handler.dart';
import '../../models/login_model_request.dart';
import '../../models/login_repo_model.dart';
import '../../models/user_role_repo.dart';

abstract class RemoteLoginDataSource {
  Future<ApiResult<LoginResponseModel>> login(LoginRequestModel requestData);
  Future<ApiResult<UserRoleResponse>> userRule();
}