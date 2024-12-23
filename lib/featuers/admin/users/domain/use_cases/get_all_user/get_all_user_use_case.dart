import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/entities/get_all_user_repo_entities.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/repositories/get_all_user_repo/get_all_user_repo.dart';

class GetAllUserUseCase {
  final GetAllUserRepo _allUserRepo;
  GetAllUserUseCase(this._allUserRepo);
  Future<ApiResult<List<GetAllUsersRepoModelEntities>>> call() =>
      _allUserRepo.getAllUser();
}
