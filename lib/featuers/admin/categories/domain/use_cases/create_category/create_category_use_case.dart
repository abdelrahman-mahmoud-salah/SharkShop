import '../../../../../../core/services/api_error_handler.dart';
import '../../../data/models/create_category/create_catecory_model_request.dart';
import '../../../data/models/create_category/create_category_model_repo.dart';
import '../../repositories/create_category/create_category_repo.dart';

class CreateCategoryUseCase {
  CreateCategoryRepo _categoryRepo;
CreateCategoryUseCase(this._categoryRepo);

  Future<ApiResult<CreateCategoryModelRepo>> call(CreateCatecoryModelRequest model)=>_categoryRepo.createCategry(model);
}
