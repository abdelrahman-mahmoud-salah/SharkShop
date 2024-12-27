import '../../../../../../core/services/api_error_handler.dart';

abstract class DeleteCategoryRepo {
  // ignore: non_constant_identifier_names
  Future<ApiResult<void>> DeleteCategory(String id);
}