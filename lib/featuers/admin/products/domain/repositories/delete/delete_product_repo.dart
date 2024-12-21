import 'package:flutter_application_2/core/services/api_error_handler.dart';

abstract class DeleteProductRepo {
  Future<ApiResult<void>> deleteProduct(String id);
}
