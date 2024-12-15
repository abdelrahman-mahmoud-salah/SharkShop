import '../../../../../../../core/services/api_error_handler.dart';
import '../../../../../../../core/services/api_services.dart';
import '../../../../../../../core/services/graphql/category/delete_category.dart';
import 'delete_category_remote.dart';

class DeleteCategoryRemoteImpl implements DeleteCategoryRemote {
  ApiService _apiService;
  DeleteCategoryRemoteImpl(this._apiService);
  @override
  Future<ApiResult<void>> deleteCategory(String id) async {
    try {
      var category = await _apiService
          .deletecategory(DeleteCategory().deleteMapQuery(categoryId: id));
      return ApiResult.success(category);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
