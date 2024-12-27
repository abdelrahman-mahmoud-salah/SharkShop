import '../../../../../../core/services/api_error_handler.dart';
import '../../data_source/remote/get_all_product/get_all_product_remote.dart';
import '../../models/get_all_product/product_repo_model.dart';
import '../../../domain/repositories/product_repo.dart';

class GetAllProductRepoImpl implements GetAllProductRepo {
  GetAllProductRepoImpl(this._allCatedoryRemote);
  final GetAllProductRemote _allCatedoryRemote;
  @override
  Future<ApiResult<List<ProductRepoModel>>> getAllProduct() =>
      _allCatedoryRemote.getAllProduct();
}
