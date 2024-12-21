import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/create_product/create_product_repo_model.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/create_product/create_product_request_model.dart';
import 'package:flutter_application_2/featuers/admin/products/domain/repositories/create_product/create_product_repo.dart';

class CreateProductUseCase {
  final CreateProductRepo _createProductRepo;
  CreateProductUseCase(this._createProductRepo);
  Future<ApiResult<CreateProductRepoModel>> call(
          CreateProductRequestModel model) =>
      _createProductRepo.createProductRep(model);
}
