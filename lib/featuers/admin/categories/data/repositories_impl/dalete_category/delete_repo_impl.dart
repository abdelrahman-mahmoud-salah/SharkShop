import '../../../../../../core/services/api_error_handler.dart';
import '../../data_sources/remote/dalete_category/delete_category_remote.dart';
import '../../../domain/repositories/dalete_category/delete_category_repo.dart';

class DeleteCategoryRepoImpl implements DeleteCategoryRepo {
  final DeleteCategoryRemote _deleteCategory;
  DeleteCategoryRepoImpl(this._deleteCategory);
  @override
  // ignore: non_constant_identifier_names
  Future<ApiResult<void>> DeleteCategory(String id) =>
      _deleteCategory.deleteCategory(id);
}
