import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/entities/get_all_user_repo_entities.dart';

abstract class GetAllUserRepo {
  Future<ApiResult<List<GetAllUsersRepoModelEntities>>> getAllUser();
}
