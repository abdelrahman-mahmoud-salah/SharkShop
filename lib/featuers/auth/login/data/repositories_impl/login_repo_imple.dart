import '../../../../../core/services/api_error_handler.dart';
import '../data_sources/remote/remote_ds.dart';
import '../models/login_model_request.dart';
import '../models/login_repo_model.dart';
import '../../domain/repositories/login_repo.dart';

class LoginRepoImple implements LoginRepository {
  final RemoteLoginDataSource _loginDataSource;
  LoginRepoImple(this._loginDataSource);
  @override
  Future<ApiResult<LoginResponseModel>> logIn(
          LoginRequestModel signInRequestModel) =>
      _loginDataSource.login(signInRequestModel);
}
