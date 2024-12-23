import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/core/services/api_services.dart';
import 'package:flutter_application_2/core/services/graphql/admin/product/delete_product.dart';
import 'package:flutter_application_2/featuers/admin/products/data/data_source/remote/delete_product/delete_product_remote.dart';

class DeleteProductRemoteImpl extends DeleteProductRemote {
  final ApiService _apiService;

  DeleteProductRemoteImpl(
    this._apiService,
  );
  @override
  Future<ApiResult<void>> deleteProduct(String id) async {
    try {
      var result = await _apiService
          .deleteProduct(DeleteProduct().deleteMapQuery(productId: id));
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
