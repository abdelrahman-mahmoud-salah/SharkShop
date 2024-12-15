import '../../../../../../../core/services/api_error_handler.dart';
import '../../../models/product_repo_model.dart';

abstract class GetAllProductRemote {
  Future<ApiResult<List<ProductRepoModel>>> getAllProduct();
}
