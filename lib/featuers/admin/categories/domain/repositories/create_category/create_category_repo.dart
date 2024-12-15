import '../../../../../../core/services/api_error_handler.dart';
import '../../../data/models/create_category/create_catecory_model_request.dart';
import '../../../data/models/create_category/create_category_model_repo.dart';

abstract class CreateCategoryRepo {
  Future<ApiResult<CreateCategoryModelRepo>> createCategry(CreateCatecoryModelRequest model);
}
