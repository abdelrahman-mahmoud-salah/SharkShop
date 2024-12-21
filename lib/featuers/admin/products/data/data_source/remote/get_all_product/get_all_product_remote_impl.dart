import '../../../../../../../core/services/api_error_handler.dart';
import '../../../../../../../core/services/api_services.dart';
import 'get_all_product_remote.dart';
import '../../../models/get_all_product/product_repo_model.dart';

class GetAllProductRemoteImpl implements GetAllProductRemote {
  GetAllProductRemoteImpl(this._apiManager);
  ApiManager _apiManager;
  @override
  Future<ApiResult<List<ProductRepoModel>>> getAllProduct() async {
    try {
      var result = await _apiManager.getAllProduct();
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
