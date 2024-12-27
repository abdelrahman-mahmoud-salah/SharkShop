import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/di/dependency_injection.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/blocs/bloc/user_info_bloc.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/blocs/bloc/user_info_event.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/pages/profile_customer_boody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCusromerScreen extends StatelessWidget {
  const ProfileCusromerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserInfoBloc>()..add(const UserInfoEvent()),
      child: const ProfileCutomerBoody(),
    );
  }
}
