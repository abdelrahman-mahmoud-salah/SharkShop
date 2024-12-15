import '../../../../../../core/services/api_error_handler.dart';
import '../../data_sources/remote/create_category/create_category_remote_data.dart';
import '../../models/create_category/create_catecory_model_request.dart';
import '../../models/create_category/create_category_model_repo.dart';
import '../../../domain/repositories/create_category/create_category_repo.dart';

class CreateCategoryRepoImpl implements CreateCategoryRepo {
  final CreateCategoryRemoteData _categoryRemoteData;

  CreateCategoryRepoImpl(this._categoryRemoteData);
  @override
  Future<ApiResult<CreateCategoryModelRepo>> createCategry(
          CreateCatecoryModelRequest model) =>
      _categoryRemoteData.createCategory(model);
}
