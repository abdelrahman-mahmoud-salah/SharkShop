import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/core/services/api_services.dart';
import 'package:flutter_application_2/featuers/admin/products/data/data_source/remote/create_product/create_product_remote.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/create_product/create_product_repo_model.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/create_product/create_product_request_model.dart';

class CreateProductRemoteImpl implements CreateProductRemote {
  final ApiManager _apiManager;

  CreateProductRemoteImpl(this._apiManager);

  @override
  Future<ApiResult<CreateProductRepoModel>> createProduct(
      CreateProductRequestModel model) async {
    try {
      var result = await _apiManager.createProduct(model);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
