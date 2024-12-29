import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/custom_linear_bottom.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/product_Admin_item.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_product/get_all_product_event.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/widgets/banner_sales.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/widgets/category_customer/category_customer_logic.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/widgets/product_customer/gride_view_customer_product.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/widgets/product_customer/product_customer_logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCustomerScreenBoody extends StatelessWidget {
  const HomeCustomerScreenBoody({super.key, this.controller});
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        controller: controller,
        slivers: [
          //banners
          const SliverToBoxAdapter(child: BannerSales()),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 25.h,
          )),
          SliverToBoxAdapter(
              child: TextApp(
            text: context.lang.categories,
            theme: context.textStyle.copyWith(
                color: context.mycolors.textColorInButton, fontSize: 20.sp),
          )),
          const SliverToBoxAdapter(child: CategoryCustomer()),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 10.h,
          )),
          SliverToBoxAdapter(
              child: TextApp(
            text: context.lang.products,
            theme: context.textStyle.copyWith(
                color: context.mycolors.textColorInButton, fontSize: 22.sp),
          )),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 10.h,
          )),
          const SliverToBoxAdapter(child: ProductCustomerLogic()),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 10.h,
          )),
          SliverToBoxAdapter(
              child: ViewAllButton()),
        ],
      ),
    );
  }
}

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomLinearButton(
                onPressed: () {
    context
        .read<AllProductCustomerBloc>()
        .add( GetAllProductCustomer(TypeStatus: "a",idCategory:context.read<AllProductCustomerBloc>().categoryId ));
                },
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: TextApp(
      text: context.lang.view_all,
      theme: context.textStyle.copyWith(
          fontSize: 25.sp,
          fontWeight: FontWeight.w500,
          color: context.mycolors.textColorInButton)),
              );
  }
}
