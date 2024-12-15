import '../../../../../../../core/services/api_error_handler.dart';
import '../../../../../../../core/services/api_services.dart';
import 'create_category_remote_data.dart';
import '../../../models/create_category/create_catecory_model_request.dart';
import '../../../models/create_category/create_category_model_repo.dart';

class CreateCategoryRemoteImpl implements CreateCategoryRemoteData {
  final ApiManager _apiManager;
  CreateCategoryRemoteImpl(this._apiManager);
  @override
  Future<ApiResult<CreateCategoryModelRepo>> createCategory(
      CreateCatecoryModelRequest model) async {
    try {
      var result = await _apiManager.createCategory(model);
   return   ApiResult.success(result);
    } catch (e) {
   return   ApiResult.failure(e.toString());
    }
  }
}
