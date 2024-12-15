import '../../../../../../core/services/api_error_handler.dart';
import '../../../data/models/get_all_category/get_all_category_repo_model.dart';
import '../../repositories/get_all_category/get_all_category_repo.dart';

class GetAllCategoryUseCase {
  final GetAllCategoryRepository _getAllCategoryRepository;
  GetAllCategoryUseCase(this._getAllCategoryRepository);
   // ignore: non_constant_identifier_names
   Future<ApiResult<List<GetAllCategoryRepoModel>>> Call() =>
      _getAllCategoryRepository.getAllCategory();
}
