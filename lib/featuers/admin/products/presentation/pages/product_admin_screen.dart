import 'package:flutter/material.dart';
import '../../../../../core/common/widget/app_bar.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/extension/context_extention.dart';
import '../blocs/get_all_product/get_all_product_bloc.dart';
import '../blocs/get_all_product/get_all_product_event.dart';
import 'product_admin_screen_boody.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductAdminScreen extends StatelessWidget {
  const ProductAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.mycolors.mainColor,
        appBar: AdminAppBar(
          title: context.lang.products,
          isMain: true,
          backgroundColor: context.mycolors.mainColor!,
        ),
        body: BlocProvider(
            create: (context) => sl<GetAllProductBloc>()
              ..add(GetAllProductEvent.getAllProducts()),
            child: const ProductAdminScreenBoody()),
      ),
    );
  }
}
