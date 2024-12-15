import 'package:flutter/material.dart';
import '../../../../../core/common/widget/app_bar.dart';
import '../../../../../core/di/dependency_injection.dart';

import '../../../../../core/extension/context_extention.dart';
import '../../../categories/presentation/blocs/get_all_category_bloc/getallcategory_bloc.dart';
import '../../../categories/presentation/blocs/get_all_category_bloc/getallcategory_event.dart';
import '../blocs/productNumber/product_number_bloc.dart';
import '../blocs/productNumber/product_number_event.dart';
import 'dash_board_boody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductNumberBloc>()
            ..add(const ProductsNumberEvent.getProductsNumber()),
        ),
        BlocProvider(
          create: (context) => sl<GetallcategoryBloc>()
            ..add(const GetallcategoryEvent.getAllCategry(isloading: true)),
        ),
      ],
      child: Scaffold(
        backgroundColor: context.mycolors.mainColor,
        appBar: AdminAppBar(
          title: 'DashBoard',
          isMain: true,
          backgroundColor: context.mycolors.mainColor!,
        ),
        body: const DashBoardBoody(),
      ),
    );
  }
}
