import '../../../../../../../core/services/api_error_handler.dart';
import '../../../../../../../core/services/api_services.dart';
import 'get_all_catedory_remote.dart';
import '../../../models/get_all_category/get_all_category_repo_model.dart';

class GetAllCatedoryRemoteImpl extends GetAllCatedoryRemote {
  final ApiManager _apiManager;
  GetAllCatedoryRemoteImpl(this._apiManager);
  @override
  Future<ApiResult<List<GetAllCategoryRepoModel>>> getAllCategory() async{
    try {
      var result =await _apiManager.getAllCategory();
    return  ApiResult.success(result);
    } catch (e) {
    return  ApiResult.failure(e.toString());
    }
  }
}
