import '../../../../../../core/services/api_error_handler.dart';
import '../../repositories/dalete_category/delete_category_repo.dart';

class DeleteCategoryUseCase {
  final DeleteCategoryRepo _categoryRepo;
  DeleteCategoryUseCase(this._categoryRepo);
  Future<ApiResult<void>> call(String id) => _categoryRepo.DeleteCategory(id);
}
