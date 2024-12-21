import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/products/data/data_source/remote/delete_product/delete_product_remote.dart';
import 'package:flutter_application_2/featuers/admin/products/domain/repositories/delete/delete_product_repo.dart';

class DeleteProductRepoImpl implements DeleteProductRepo {
  final DeleteProductRemote _deleteProductRemote;
  DeleteProductRepoImpl(this._deleteProductRemote);
  @override
  Future<ApiResult<void>> deleteProduct(String id) =>
      _deleteProductRemote.deleteProduct(id);
}
