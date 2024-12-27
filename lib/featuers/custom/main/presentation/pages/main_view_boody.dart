import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app/Appcubit/app_cubit.dart';
import 'package:flutter_application_2/core/styles/images/app_images.dart';
import 'package:flutter_application_2/featuers/custom/favourite/presentation/pages/favourite_customer_screen.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/pages/home_customer_screen.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_cubit.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_state.dart';
import 'package:flutter_application_2/featuers/custom/main/presentation/widgets/nav_bar_main.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/pages/profile_cusromer_screen.dart';
import 'package:flutter_application_2/featuers/notification/notification_customer_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenBoody extends StatelessWidget {
  const MainScreenBoody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(context.read<AppCubit>().dark
                  ? AppImages.homeBgDark
                  : AppImages.homeBgLight),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          Expanded(
              child: BlocBuilder<RoutesMainNavBarCubit, RoutesMainNavBarState>(
            builder: (context, state) {
              if (state.page == RoutesMainNavBarStateValue.profile) {
                return const ProfileCusromerScreen();
              } else if (state.page ==
                  RoutesMainNavBarStateValue.notifications) {
                return const NotificationCustomerScreen();
              } else if (state.page == RoutesMainNavBarStateValue.favourites) {
                return const FavouriteCustomerScreen();
              }
              return const HomeCustomerScreen();
            },
          )),
          const NavBarMain(),
        ],
      ),
    );
  }
}
