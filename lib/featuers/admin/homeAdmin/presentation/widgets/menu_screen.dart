import 'package:flutter/material.dart';
import '../../../../../core/common/widget/app_bar.dart';
import '../../../../../core/extension/context_extention.dart';
import '../../../../../core/utils/admin_drawer_model.dart';

class MenuAdminScren extends StatelessWidget {
  const MenuAdminScren({required this.onPageChanged, super.key});

  final void Function(Widget) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.mycolors.bluePinkDark,
      appBar: AdminAppBar(
        isMain: false,
        backgroundColor: context.mycolors.bluePinkDark!,
        title: 'HopShop',
      ),
      body: Column(
        children: [
          Column(
            children: adminDrawerList(context)
                .map(
                  (e) => ListTile(
                    onTap: () {
                      onPageChanged(e.page);
                    },
                    title: e.title,
                    leading: e.icon,
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: Image.asset("assets/images/core/splash_ios_android_11.png"),
          ),
        ],
      ),
    );
  }
}
