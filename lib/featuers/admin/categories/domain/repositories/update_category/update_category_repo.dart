import '../../../../../../core/services/api_error_handler.dart';
import '../../../data/models/create_category/create_catecory_model_request.dart';
import '../../../data/models/create_category/create_category_model_repo.dart';

abstract class UpdateCategoryRepository {
  // ignore: non_constant_identifier_names
  Future<ApiResult<CreateCategoryModelRepo>> UpdateCategory(
      {required final String id,
      required final CreateCatecoryModelRequest model});
}
