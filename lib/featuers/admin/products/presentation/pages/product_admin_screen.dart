import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/delete_product/delete_product_bloc.dart';
import '../../../../../core/common/widget/app_bar.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/extension/context_extention.dart';
import '../blocs/get_all_product/get_all_product_bloc.dart';
import '../blocs/get_all_product/get_all_product_event.dart';
import 'product_admin_screen_boody.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProductAdminScreen extends StatelessWidget {
  const ProductAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.mycolors.mainColor,
        appBar: AdminAppBar(
          title: context.lang.products,
          isMain: true,
          backgroundColor: context.mycolors.mainColor!,
        ),
        body: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => sl<AllProductBloc>()..add(GetAllProduct()),
          ),
          BlocProvider(
            create: (context) => sl<DeleteProductBloc>(),
          )
        ], child: const ProductAdminScreenBoody()));
  }
}
