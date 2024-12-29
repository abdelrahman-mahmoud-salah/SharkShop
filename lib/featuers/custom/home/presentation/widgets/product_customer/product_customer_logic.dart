import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/emty_screen.dart';
import 'package:flutter_application_2/core/common/widget/error_screen.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_product/get_all_product_state.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/widgets/product_customer/gride_view_customer_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCustomerLogic extends StatelessWidget {
  const ProductCustomerLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductCustomerBloc, AllProductCustomerState>(
      builder: (context, state) {
        if (state.status == AllProductCustomerStateValues.loading) {
          return Skeletonizer(
              effect: const ShimmerEffect(),
              child: GrideViewCustomerProduct(
                products: [],
                loading: true,
              ));
        } else if (state.status == AllProductCustomerStateValues.empty) {
          return EmptyScreen(title: context.lang.empty_category);
        } else if (state.status == AllProductCustomerStateValues.allView) {
          return GrideViewCustomerProduct(
            products: state.products!,
          );
        } else if (state.status == AllProductCustomerStateValues.categoryKind) {
          return GrideViewCustomerProduct(
            products: state.products!,
          );
        } else if (state.status == AllProductCustomerStateValues.success) {
          return GrideViewCustomerProduct(
            products: state.products!,
          );
        } else if (state.status == AllProductCustomerStateValues.error) {
          return ErrorScreen();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
