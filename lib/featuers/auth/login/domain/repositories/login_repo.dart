import '../../../../../core/services/api_error_handler.dart';
import '../../data/models/login_model_request.dart';
import '../../data/models/login_repo_model.dart';

abstract class LoginRepository {
  Future<ApiResult<LoginResponseModel>> logIn(LoginRequestModel signInRequestModel);
}