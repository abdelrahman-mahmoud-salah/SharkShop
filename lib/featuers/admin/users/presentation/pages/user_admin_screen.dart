import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/app_bar.dart';
import 'package:flutter_application_2/core/di/dependency_injection.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_bloc.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_event.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/pages/user_admin_boody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAdminScreen extends StatelessWidget {
  const UserAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.mycolors.mainColor,
      appBar: AdminAppBar(
        isMain: true,
        backgroundColor: context.mycolors.mainColor!,
        title: context.lang.users,
      ),
      body: BlocProvider(
        create: (context) =>
            sl<AllUserBloc>()..add(GetAllUserEvent(loading: true)),
        child: const UserAdminBoody(),
      ),
    );
  }
}
