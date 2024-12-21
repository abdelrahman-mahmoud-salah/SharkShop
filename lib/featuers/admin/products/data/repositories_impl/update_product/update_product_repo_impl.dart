import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/products/data/data_source/remote/update_product/update_product_remote.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/get_all_product/product_repo_model.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/update/update_product_request_model.dart';
import 'package:flutter_application_2/featuers/admin/products/domain/repositories/update/update_product_repo.dart';

class UpdateProductRepoImpl implements UpdateProductRepo {
 final UpdateProductRemote _productRemote;

  UpdateProductRepoImpl(this._productRemote);
  @override
  Future<ApiResult<ProductRepoModel>> updatProduct(
          String id, UpdateProductRequestModel model) =>
      _productRemote.updateProduct(id, model);
}
