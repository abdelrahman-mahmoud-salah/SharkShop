import 'package:flutter/material.dart';
import '../../../../../core/common/toast/show_toast.dart';
import '../../../../../core/common/widget/emty_screen.dart';
import '../../../../../core/common/widget/error_screen.dart';
import '../../../../../core/extension/context_extention.dart';
import '../blocs/delete_category/delete_category_bloc.dart';
import '../blocs/delete_category/delete_category_state.dart';
import '../blocs/get_all_category_bloc/getallcategory_bloc.dart';
import '../blocs/get_all_category_bloc/getallcategory_event.dart';
import '../blocs/get_all_category_bloc/getallcategory_state.dart';
import 'item_of_category.dart';
import 'loading_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewOfCategoruItem extends StatelessWidget {
  const ListViewOfCategoruItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetallcategoryBloc, GetallcategoryState>(
      builder: (context, state) {
        if (state.state == GetallcategoryStateValue.loading) {
          return ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20.h,
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const LoadingItem();
              });
        } else if (state.state == GetallcategoryStateValue.empty) {
          return EmptyScreen(
            title: context.lang.empty_category,
          );
        } else if (state.state == GetallcategoryStateValue.error) {
          return ErrorScreen(
            onRefresh: () async {
              context.read<GetallcategoryBloc>().add(
                  const GetallcategoryEvent.getAllCategry(isloading: true));
            },
          );
        } else {
          return BlocListener<DeleteCategoryBloc, DeleteCategoryState>(
            listener: (context, state) {
              if (state.state == DeleteCategoryValueState.success) {
                return ShowToast.showToastSuccessTop(
                    message: context.lang.is_delete, seconds: 40);
              } else if (state.state == DeleteCategoryValueState.error) {
                return ShowToast.showToastErrorTop(
                    message: context.lang.not_delete, seconds: 40);
              }
            },
            child: ListView.separated(
                itemCount: state.categories?.length ?? 0,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.h,
                  );
                },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  //TODO:enter All The model
                  return CategoryItem(
                    image: state.categories![index].image ?? "",
                    name: state.categories![index].name ?? "",
                    id: state.categories![index].id.toString(),
                  );
                }),
          );
        }
      },
    );
  }
}
