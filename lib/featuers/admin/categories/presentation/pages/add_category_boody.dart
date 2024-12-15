import 'package:flutter/material.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../blocs/delete_category/delete_category_bloc.dart';
import '../blocs/get_all_category_bloc/getallcategory_bloc.dart';
import '../blocs/get_all_category_bloc/getallcategory_event.dart';
import '../widgets/create/add_category_button.dart';
import '../widgets/list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryBoody extends StatelessWidget {
  const AddCategoryBoody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          const AddCategoryButton(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetallcategoryBloc>().add(
                    const GetallcategoryEvent.getAllCategry(isloading: true));
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: BlocProvider(
                    create: (context) => sl<DeleteCategoryBloc>(),
                    child: const ListViewOfCategoruItem(),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
