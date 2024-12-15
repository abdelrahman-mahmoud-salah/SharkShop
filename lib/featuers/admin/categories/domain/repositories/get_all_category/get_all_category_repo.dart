import '../../../../../../core/services/api_error_handler.dart';
import '../../../data/models/get_all_category/get_all_category_repo_model.dart';

abstract class GetAllCategoryRepository {
  Future<ApiResult<List<GetAllCategoryRepoModel>>> getAllCategory();
}
