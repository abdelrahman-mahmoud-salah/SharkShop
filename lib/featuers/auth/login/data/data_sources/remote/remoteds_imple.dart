import '../../../../../../core/services/api_error_handler.dart';
import '../../../../../../core/services/api_services.dart';
import '../../../../../../core/services/graphql/auth/auth_query.dart';
import 'remote_ds.dart';
import '../../models/login_model_request.dart';
import '../../models/login_repo_model.dart';
import '../../models/user_role_repo.dart';

class LoogInRemotedsImplementation implements RemoteLoginDataSource {
  final ApiService _graphql;
  LoogInRemotedsImplementation(this._graphql);
  @override
  Future<ApiResult<UserRoleResponse>> userRule() {

    throw UnimplementedError();
  }

  @override
  Future<ApiResult<LoginResponseModel>> login(
      LoginRequestModel requestData) async {
    try {
      final result =
          await _graphql.Login(AuthQueries().loginMapQuery(body: requestData));
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
