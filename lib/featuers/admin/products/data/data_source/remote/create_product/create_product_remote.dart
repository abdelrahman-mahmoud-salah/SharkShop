import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/create_product/create_product_repo_model.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/create_product/create_product_request_model.dart';

abstract class CreateProductRemote {
  Future<ApiResult<CreateProductRepoModel>> createProduct(
      CreateProductRequestModel model);
}
