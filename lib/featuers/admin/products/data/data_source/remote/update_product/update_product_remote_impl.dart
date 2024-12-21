import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/core/services/api_services.dart';
import 'package:flutter_application_2/featuers/admin/products/data/data_source/remote/update_product/update_product_remote.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/get_all_product/product_repo_model.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/update/update_product_request_model.dart';

class UpdateProductRemoteImpl implements UpdateProductRemote {
  final ApiManager _apiManager;
  UpdateProductRemoteImpl(this._apiManager);
  @override
  Future<ApiResult<ProductRepoModel>> updateProduct(
      String id, UpdateProductRequestModel model) async {
    try {
      var result = await _apiManager.updateProduct(id, model);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
