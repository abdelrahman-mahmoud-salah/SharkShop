import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import '../../../../../../core/common/widget/error_screen.dart';
import '../../../../categories/presentation/blocs/get_all_category_bloc/getallcategory_bloc.dart';
import '../../../../categories/presentation/blocs/get_all_category_bloc/getallcategory_event.dart';
import '../../../../categories/presentation/blocs/get_all_category_bloc/getallcategory_state.dart';
import '../dash_board_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


BlocBuilder<GetallcategoryBloc, GetallcategoryState> allCategoryNumber() {
  return BlocBuilder<GetallcategoryBloc, GetallcategoryState>(
    builder: (context, state) {
      if (state.state == GetallcategoryStateValue.loading) {
        return DashBoardContiner(
          isLoading: true,
          number: "",
          title: context.lang.categories,
          image: "assets/images/admin/categories_drawer.png",
        );
      } else if (state.state == GetallcategoryStateValue.success) {
        return DashBoardContiner(
          isLoading: false,
          number: state.categories!.length.toString(),
          title: context.lang.categories,
          image: "assets/images/admin/categories_drawer.png",
        );
      } else if (state.state == GetallcategoryStateValue.error) {
        return ErrorScreen(
          onRefresh: () async {
            context
                .read<GetallcategoryBloc>()
                .add(const GetallcategoryEvent.getAllCategry(isloading: true));
          },
        );
      }
      return const SizedBox.shrink();
    },
  );
}
