import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/entities/get_all_user_repo_entities.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/delete_user/delete_user_bloc.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/delete_user/delete_user_event.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/delete_user/delete_user_state.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_bloc.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_event.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteUserView extends StatelessWidget {
  const DeleteUserView({
    super.key,
    required this.IdUser,
  });
  final String IdUser;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteUserBloc, DeleteUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.state == DeleteUserStatevalue.loading) {
          // ignore: unrelated_type_equality_checks
          if (state.iduser == IdUser) {
            return Center(
                child: CircularProgressIndicator(
              color: context.mycolors.textColorInButton,
              strokeWidth: 10,
            ));
          }
          return const Icon(
            Icons.delete,
            color: Colors.red,
          );
        } else {
          return IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              print(IdUser);
              context
                  .read<DeleteUserBloc>()
                  .add(DeleteUserEvent(userId: IdUser));
              context.read<AllUserBloc>().add(GetAllUserEvent(loading: false));
            },
          );
        }
      },
    );
  }
}
