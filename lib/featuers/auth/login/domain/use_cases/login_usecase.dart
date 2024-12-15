import '../../../../../core/services/api_error_handler.dart';
import '../../data/models/login_model_request.dart';
import '../../data/models/login_repo_model.dart';
import '../repositories/login_repo.dart';

class LoginUseCase {
  LoginRepository signUpRepo;
  LoginUseCase( this.signUpRepo);
  // ignore: non_constant_identifier_names
  Future<ApiResult<LoginResponseModel>> Call(
         // ignore: non_constant_identifier_names
         { required LoginRequestModel SignInRequestModel}) =>
      signUpRepo.logIn(SignInRequestModel);
}