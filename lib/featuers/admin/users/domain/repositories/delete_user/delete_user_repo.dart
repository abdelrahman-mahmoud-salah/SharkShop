import 'package:flutter_application_2/core/services/api_error_handler.dart';

abstract class DeleteUserRepo {
  Future<ApiResult<void>> deleteUser(String id);
}