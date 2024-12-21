import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/get_all_product/product_repo_model.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/update/update_product_request_model.dart';

abstract class UpdateProductRemote {
  Future<ApiResult<ProductRepoModel>> updateProduct(
      String id, UpdateProductRequestModel model);
}
