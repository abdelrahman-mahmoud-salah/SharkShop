import 'package:flutter/material.dart';
import '../../../../../core/extension/context_extention.dart';
import '../../../dashboard/presentation/pages/dashboard_view.dart';
import '../widgets/menu_screen.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeAdminView extends StatefulWidget {
  const HomeAdminView({super.key});

  @override
  State<HomeAdminView> createState() => _HomeAdminViewState();
}

class _HomeAdminViewState extends State<HomeAdminView> {
  Widget page = const DashBoardView();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return MenuAdminScren(
            onPageChanged: (a) {
              setState(() {
                page = a;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        },
      ),
      mainScreen: page,
      borderRadius: 24,
      showShadow: true,
      drawerShadowsBackgroundColor: context.mycolors.mainColor!,
      menuBackgroundColor: context.mycolors.bluePinkDark!,
    );
  }
}
