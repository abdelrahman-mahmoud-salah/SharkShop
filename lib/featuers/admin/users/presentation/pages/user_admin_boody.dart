import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/emty_screen.dart';
import 'package:flutter_application_2/core/common/widget/error_screen.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/core/loading/shimmer_loading.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_bloc.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_event.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_state.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/widgets/search_about_users.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/widgets/user_table_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAdminBoody extends StatelessWidget {
  const UserAdminBoody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          const SearchAboutUser(),
          SizedBox(height: 20.h),
          Expanded(
              flex: 1,
              child: RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<AllUserBloc>()
                      .add(GetAllUserEvent(loading: true));
                },
                child: CustomScrollView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: BlocBuilder<AllUserBloc, AllUserState>(
                        builder: (context, state) {
                          if (state.state == AllUserStatevalue.loading) {
                            return Center(
                              child: LoadingShimmer(
                                height: 1000.h,
                                width: 1000.w,
                                borderRadius: 50,
                              ),
                            );
                          } else if (state.state == AllUserStatevalue.empty) {
                            return EmptyScreen(
                              title: context.lang.empty_users,
                            );
                          } else if (state.state == AllUserStatevalue.error) {
                            return ErrorScreen();
                          } else if (state.state == AllUserStatevalue.search) {
                            return UsersTableView(model: state.model ?? []);
                          } else {
                            return UsersTableView(model: state.model ?? []);
                          }
                        },
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
