import '../../../../../../../core/services/api_error_handler.dart';
import '../../../models/create_category/create_catecory_model_request.dart';
import '../../../models/create_category/create_category_model_repo.dart';

abstract class UpdateCategoryRemote {
  Future<ApiResult<CreateCategoryModelRepo>> updateCategory(
      {required String id, required CreateCatecoryModelRequest model});
}
