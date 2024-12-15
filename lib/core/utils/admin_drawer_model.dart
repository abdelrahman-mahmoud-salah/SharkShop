import 'package:flutter/material.dart';
import '../common/widget/text_app.dart';
import '../extension/context_extention.dart';
import '../styles/fonts/font_family.dart';
import '../../featuers/admin/categories/presentation/pages/add_category_screen.dart';
import '../../featuers/admin/dashboard/presentation/pages/dashboard_view.dart';
import '../../featuers/admin/products/presentation/pages/product_admin_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return <DrawerItemModel>[
    //DashBoard
    DrawerItemModel(
      icon: const Icon(
        Icons.dashboard,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'DashBoard',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
          fontWeight: FontWeight.bold,
        ),
      ),
      page: const DashBoardView(),
    ),
    DrawerItemModel(
      icon: const Icon(
        Icons.category_outlined,
        color: Colors.white,
      ),
      title: TextApp(
        text: context.lang.categories,
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
          fontWeight: FontWeight.bold,
        ),
      ),
      page: const AddCategoryScreen(),
    ),
    DrawerItemModel(
      icon: const Icon(
        Icons.production_quantity_limits_outlined,
        color: Colors.white,
      ),
      title: TextApp(
        text: context.lang.products,
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
          fontWeight: FontWeight.bold,
        ),
      ),
      page: const ProductAdminScreen(),
    ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.page,
  });

  final Icon icon;
  final Widget title;
  final Widget page;
}
