import '../../../../../../../core/services/api_error_handler.dart';

abstract class DeleteCategoryRemote {
  Future<ApiResult<void>> deleteCategory(String id);
}
