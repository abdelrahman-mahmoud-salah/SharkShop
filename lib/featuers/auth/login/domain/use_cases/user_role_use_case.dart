import '../../../../../core/services/api_error_handler.dart';
import '../../data/models/user_role_repo.dart';
import '../repositories/user_role_repo.dart';

class UserRoleUseCase {
  UserRoleRepository signUpRepo;
  UserRoleUseCase({required this.signUpRepo});
  // ignore: non_constant_identifier_names
  Future<ApiResult<UserRoleResponse>> Call(
         // ignore: non_constant_identifier_names
         { required String userRole}) =>
      signUpRepo.userRole(userRole);
}