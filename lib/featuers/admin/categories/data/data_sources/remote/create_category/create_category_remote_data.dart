import '../../../../../../../core/services/api_error_handler.dart';
import '../../../models/create_category/create_catecory_model_request.dart';
import '../../../models/create_category/create_category_model_repo.dart';

abstract class CreateCategoryRemoteData {
  Future<ApiResult<CreateCategoryModelRepo>> createCategory(CreateCatecoryModelRequest model);
}
