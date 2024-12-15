import '../../../../../../core/services/api_error_handler.dart';

abstract class DeleteCategoryRepo {
  Future<ApiResult<void>> DeleteCategory(String id);
}