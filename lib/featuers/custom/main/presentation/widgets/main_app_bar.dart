import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/animation/animation_do.dart';
import 'package:flutter_application_2/core/common/widget/custom_linear_bottom.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/core/styles/images/app_images.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_cubit.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.mycolors.mainColor,
        elevation: 0,
        title: BlocBuilder<RoutesMainNavBarCubit, RoutesMainNavBarState>(
          builder: (context, state) {
            if (state.page == RoutesMainNavBarStateValue.home) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFadeInRight(
                      duration: 800,
                      child: TextApp(
                        text: context.lang.choose_products,
                        theme: context.textStyle.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: context.mycolors.textColorInButton,
                        ),
                      ),
                    ),
                    CustomFadeInLeft(
                      duration: 800,
                      child: CustomLinearButton(
                        onPressed: () {},
                        child: Center(
                          child: SvgPicture.asset(AppImages.search),
                        ),
                      ),
                    )
                  ]);
            } else if (state.page == RoutesMainNavBarStateValue.favourites) {
              return CustomFadeInRight(
                duration: 800,
                child: TextApp(
                  text: 'Your Favorite',
                  theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: context.mycolors.textColorInButton,
                  ),
                ),
              );
            } else if (state.page == RoutesMainNavBarStateValue.notifications) {
              return CustomFadeInRight(
                duration: 800,
                child: TextApp(
                  text: 'Notifications',
                  theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: context.mycolors.textColorInButton,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
