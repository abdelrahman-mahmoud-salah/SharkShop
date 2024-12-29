import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/error_screen.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_category_bloc/getallcategory_bloc.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_category_bloc/getallcategory_state.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/widgets/category_customer/Category_customer_list_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:skeletonizer/skeletonizer.dart';

class CategoryCustomer extends StatelessWidget {
  const CategoryCustomer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetallcategoryInCustomerBloc,
        GetallcategoryInCustomerState>(
      builder: (context, state) {
        if (state.state == GetallcategoryStateValue.loading) {
          return Skeletonizer(
            effect: const ShimmerEffect(),

            child: CategoryCustomerList(
              categories: [],
              loading: true,
            ),
          );
        } else if (state.state == GetallcategoryStateValue.error) {
          return ErrorScreen();
        } else if (state.state == GetallcategoryStateValue.success) {
          return CategoryCustomerList(
            categories: state.categories,
            loading: false,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
