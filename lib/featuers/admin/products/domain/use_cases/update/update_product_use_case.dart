import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/get_all_product/product_repo_model.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/update/update_product_request_model.dart';
import 'package:flutter_application_2/featuers/admin/products/domain/repositories/update/update_product_repo.dart';

class UpdateProductUseCase {
  final UpdateProductRepo _productRepo;
  UpdateProductUseCase(this._productRepo);
  Future<ApiResult<ProductRepoModel>> call(
          String id, UpdateProductRequestModel model) =>
      _productRepo.updatProduct(id, model);
}
