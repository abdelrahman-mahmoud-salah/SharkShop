import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app/Appcubit/app_cubit.dart';
import 'package:flutter_application_2/core/app/Appcubit/app_state.dart';
import 'package:flutter_application_2/core/styles/images/app_images.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_cubit.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_state.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/widgets/icon_selected_tab_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconsInNavBar extends StatelessWidget {
  const IconsInNavBar({
    super.key,
    required this.cubit,
  });

  final RoutesMainNavBarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20.w,
              ),
              IconTapNavBar(
                icon: AppImages.homeTab,
                isSelected: cubit.stateValue == RoutesMainNavBarStateValue.home,
                onTap: () {
                  cubit.routesNavBar(
                    value: RoutesMainNavBarStateValue.home,
                  );
                },
              ),
              IconTapNavBar(
                icon: AppImages.favouritesTab,
                isSelected:
                    cubit.stateValue == RoutesMainNavBarStateValue.favourites,
                onTap: () {
                  cubit.routesNavBar(
                    value: RoutesMainNavBarStateValue.favourites,
                  );
                },
              ),
              IconTapNavBar(
                icon: AppImages.notificationIcon,
                isSelected: cubit.stateValue ==
                    RoutesMainNavBarStateValue.notifications,
                onTap: () {
                  cubit.routesNavBar(
                    value: RoutesMainNavBarStateValue.notifications,
                  );
                },
              ),
              IconTapNavBar(
                icon: AppImages.profileTab,
                isSelected:
                    cubit.stateValue == RoutesMainNavBarStateValue.profile,
                onTap: () {
                  cubit.routesNavBar(
                    value: RoutesMainNavBarStateValue.profile,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
