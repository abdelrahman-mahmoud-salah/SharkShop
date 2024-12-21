import '../../../../../core/services/api_error_handler.dart';
import '../../data/models/get_all_product/product_repo_model.dart';

abstract class GetAllProductRepo {
  Future<ApiResult<List<ProductRepoModel>>> getAllProduct();
}