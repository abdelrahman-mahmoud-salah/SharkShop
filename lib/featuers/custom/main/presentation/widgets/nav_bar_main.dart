import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/animation/animation_do.dart';
import 'package:flutter_application_2/core/app/Appcubit/app_cubit.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/core/styles/images/app_images.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_cubit.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_state.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/pages/main_view.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/widgets/background_animation.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/widgets/icons_in_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavBarMain extends StatelessWidget {
  const NavBarMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 800,
      child: Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
          height: 103.h,
          child: BlocBuilder<RoutesMainNavBarCubit, RoutesMainNavBarState>(
            builder: (context, state) {
              final cubit = context.read<RoutesMainNavBarCubit>();
              return Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 15.h),
                      Container(
                        height: 88.h,
                        color: context.mycolors.navBarbg,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                              height: 45.h,
                              width: 300.w,
                              child: const SizedBox.shrink()),
                        ),
                      )
                    ],
                  ),

                  // BackGround Icon
                  BackGroundAnimation(
                    
                   
                    
                    cubit: cubit
                  ),

                  IconsInNavBar(cubit: cubit),
                  //Car Icon
                  Positioned(
                    left: context.read<AppCubit>().english == true ? -340 : 0,
                    right: context.read<AppCubit>().english == true ? 0 : -340,
                    top: 17,
                    child: SvgPicture.asset(
                      AppImages.carShop,
                      color: Colors.white,
                      height: 20.h,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
