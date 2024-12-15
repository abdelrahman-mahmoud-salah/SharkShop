import '../../../../../../core/services/api_error_handler.dart';
import '../../models/get_all_category/get_all_category_repo_model.dart';
import '../../../domain/repositories/get_all_category/get_all_category_repo.dart';
import '../../data_sources/remote/get_all_category/get_all_catedory_remote.dart';

class GetAllCategoryRepoImpl extends GetAllCategoryRepository {
  final GetAllCatedoryRemote _getAllCatedoryRemote;
  GetAllCategoryRepoImpl(this._getAllCatedoryRemote);
  @override
  Future<ApiResult<List<GetAllCategoryRepoModel>>> getAllCategory() =>
      _getAllCatedoryRemote.getAllCategory();
}
