import '../../../../../../../core/services/api_error_handler.dart';
import '../../../models/get_all_category/get_all_category_repo_model.dart';

abstract class GetAllCatedoryRemote {
  Future<ApiResult<List<GetAllCategoryRepoModel>>> getAllCategory();
}
