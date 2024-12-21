import '../../../../../../core/services/api_error_handler.dart';
import '../../../data/models/create_category/create_catecory_model_request.dart';
import '../../../data/models/create_category/create_category_model_repo.dart';
import '../../repositories/update_category/update_category_repo.dart';

class UpdateCategoryUseCase {
  final UpdateCategoryRepository _repository;
  UpdateCategoryUseCase(this._repository);
  Future<ApiResult<CreateCategoryModelRepo>> call(
          {required String id, required CreateCatecoryModelRequest model}) =>
      _repository.UpdateCategory(id: id, model: model);
}
