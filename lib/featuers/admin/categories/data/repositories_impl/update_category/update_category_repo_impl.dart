import '../../../../../../core/services/api_error_handler.dart';
import '../../data_sources/remote/update_category/update_category_remote.dart';
import '../../models/create_category/create_catecory_model_request.dart';
import '../../models/create_category/create_category_model_repo.dart';
import '../../../domain/repositories/update_category/update_category_repo.dart';

class UpdateCategoryRepoImpl implements UpdateCategoryRepository {
  final UpdateCategoryRemote _categoryRemoteImpl;
  UpdateCategoryRepoImpl(this._categoryRemoteImpl);
  @override
  // ignore: non_constant_identifier_names
  Future<ApiResult<CreateCategoryModelRepo>> UpdateCategory(
          {required String id, required CreateCatecoryModelRequest model}) =>
      _categoryRemoteImpl.updateCategory(id: id, model: model);
}
