import '../../../../../core/services/api_error_handler.dart';
import '../../data/models/get_all_product/product_repo_model.dart';
import '../repositories/product_repo.dart';

class GetAllProductUsecase {
  GetAllProductRepo signUpRepo;
  GetAllProductUsecase( this.signUpRepo);
  // ignore: non_constant_identifier_names
  Future<ApiResult<List<ProductRepoModel>>> Call() =>
      signUpRepo.getAllProduct();
}