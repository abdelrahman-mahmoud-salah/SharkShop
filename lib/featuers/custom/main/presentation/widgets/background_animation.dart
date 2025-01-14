
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_2/core/app/Appcubit/app_cubit.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_cubit.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackGroundAnimation extends StatelessWidget {
  const BackGroundAnimation({super.key, required this.cubit});

  final RoutesMainNavBarCubit cubit;

  @override
  Widget build(BuildContext context) {
    final english = context.read<AppCubit>().english;
    if (cubit.stateValue == RoutesMainNavBarStateValue.notifications) {
      return Positioned(
        top: -8,
        left: english == true ? 235 : 67,
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: context.read<AppCubit>().dark
                  ? const AssetImage(
                      "assets/images/customer/big_nav_bar_dark.png")
                  : const AssetImage(
                      "assets/images/customer/big_nav_bar_light.png"),
            ),
          ),
        ),
      ).animate(target: 1).rotate(begin: -1, end: 1, transformHitTests: true);
    } else if (cubit.stateValue == RoutesMainNavBarStateValue.profile) {
      return Positioned(
        top: -8,
        left: english == true ? 322 : -18,
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: context.read<AppCubit>().dark
                  ? const AssetImage(
                      "assets/images/customer/big_nav_bar_dark.png")
                  : const AssetImage(
                      "assets/images/customer/big_nav_bar_light.png"),
            ),
          ),
        ),
      ).animate(target: 1).rotate(begin: -1, end: 1, transformHitTests: true);
    } else if (cubit.stateValue == RoutesMainNavBarStateValue.favourites) {
      return Positioned(
        top: -8,
        left: english == true ? 150 : 153,
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: context.read<AppCubit>().dark
                  ? const AssetImage(
                      "assets/images/customer/big_nav_bar_dark.png")
                  : const AssetImage(
                      "assets/images/customer/big_nav_bar_light.png"),
            ),
          ),
        ),
      ).animate(target: 1).rotate(begin: -1, end: 1, transformHitTests: true);
    }

    return Positioned(
      top: -8,
      left: english == true ? 65 : 240,
      child: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: context.read<AppCubit>().dark
                ? const AssetImage(
                    "assets/images/customer/big_nav_bar_dark.png")
                : const AssetImage(
                    "assets/images/customer/big_nav_bar_light.png"),
          ),
        ),
      ),
    ).animate(target: 1).rotate(begin: -1, end: 1, transformHitTests: true);
  }
}
