import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_cubit.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/pages/main_view_boody.dart';

import 'package:flutter_application_2/featuers/custom/main/presentation/widgets/main_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoutesMainNavBarCubit(),
      child: Scaffold(
        backgroundColor: context.mycolors.mainColor,
        appBar: const MainAppBar(),
        body: const MainScreenBoody(),
      ),
    );
  }
}

// ignore: must_be_immutable