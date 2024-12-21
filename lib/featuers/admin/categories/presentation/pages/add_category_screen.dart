import 'package:flutter/material.dart';
import '../../../../../core/common/widget/app_bar.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/extension/context_extention.dart';
import '../blocs/get_all_category_bloc/getallcategory_bloc.dart';
import '../blocs/get_all_category_bloc/getallcategory_event.dart';
import 'add_category_boody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.mycolors.mainColor!,
      appBar: AdminAppBar(
        title: context.lang.categories,
        isMain: true,
        backgroundColor: context.mycolors.mainColor!,
      ),
      body: BlocProvider(
        create: (context) => sl<GetallcategoryBloc>()
          ..add(const GetallcategoryEvent.getAllCategry(isloading: true)),
        child: const AddCategoryBoody(),
      ),
    );
  }
}
