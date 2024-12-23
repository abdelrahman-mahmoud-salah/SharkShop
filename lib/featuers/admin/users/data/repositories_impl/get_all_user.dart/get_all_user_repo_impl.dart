import 'package:flutter_application_2/core/services/api_error_handler.dart';
import 'package:flutter_application_2/featuers/admin/users/data/data_sources/remote/get_all_user/get_all_user_remote.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/entities/get_all_user_repo_entities.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/repositories/get_all_user_repo/get_all_user_repo.dart';

class GetAllUserRepoImpl implements GetAllUserRepo {
  final GetAllUserRemote _getAllUserRemote;
  GetAllUserRepoImpl(this._getAllUserRemote);

  @override
  Future<ApiResult<List<GetAllUsersRepoModelEntities>>> getAllUser() =>
      _getAllUserRemote.getAllUser();
}
