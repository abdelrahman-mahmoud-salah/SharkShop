import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/products/data/data_source/remote/create_product/create_product_remote.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/create_product/create_product_repo_model.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/create_product/create_product_request_model.dart';
import 'package:flutter_application_2/featuers/admin/products/domain/repositories/create_product/create_product_repo.dart';

class CreateProductRepoImpl implements CreateProductRepo {
  final CreateProductRemote _createProductRemote;
  CreateProductRepoImpl(this._createProductRemote);
  @override
  Future<ApiResult<CreateProductRepoModel>> createProductRep(
          CreateProductRequestModel model) =>
      _createProductRemote.createProduct(model);
}
