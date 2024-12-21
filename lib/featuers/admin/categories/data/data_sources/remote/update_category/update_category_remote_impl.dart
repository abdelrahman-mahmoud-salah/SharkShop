import '../../../../../../../core/services/api_error_handler.dart';
import '../../../../../../../core/services/api_services.dart';
import 'update_category_remote.dart';
import '../../../models/create_category/create_catecory_model_request.dart';
import '../../../models/create_category/create_category_model_repo.dart';

class UpdateCategoryRemoteImpl implements UpdateCategoryRemote {
  // ignore: unused_field
  final ApiManager _apiManager;
  UpdateCategoryRemoteImpl(this._apiManager);
  @override
  Future<ApiResult<CreateCategoryModelRepo>> updateCategory(
      {required String id, required CreateCatecoryModelRequest model}) async{
    try {
      var result =await _apiManager.updateCategory(id, model);
      return ApiResult.success(result);
    } catch (e) {
        return ApiResult.failure(e.toString());
    }
  }
}
