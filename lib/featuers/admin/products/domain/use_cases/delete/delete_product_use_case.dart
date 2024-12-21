import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/products/domain/repositories/delete/delete_product_repo.dart';

class DeleteProductUseCase {
  DeleteProductRepo _deleteProductRepo;

  DeleteProductUseCase(this._deleteProductRepo);
  Future<ApiResult<void>>call(String id )=> _deleteProductRepo.deleteProduct(id);
}