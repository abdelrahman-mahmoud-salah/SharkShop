import '../../../../../core/services/api_error_handler.dart';
import '../../data/models/product_repo_model.dart';

abstract class GetAllProductRepo {
  Future<ApiResult<List<ProductRepoModel>>> getAllProduct();
}