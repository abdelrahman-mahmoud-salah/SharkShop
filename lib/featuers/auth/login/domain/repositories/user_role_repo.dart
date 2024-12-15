

import '../../../../../core/services/api_error_handler.dart';
import '../../data/models/user_role_repo.dart';

abstract class UserRoleRepository {
  Future<ApiResult<UserRoleResponse>> userRole( String userRole);
}