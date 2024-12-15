import 'package:flutter/material.dart';

import '../../../../../core/extension/context_extention.dart';
import 'login_boody.dart';
import '../widgets/shape_of_bottom_navigator_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(MediaQuery.of(context).size.width, 150.h),
        painter: AuthCustomPainter(
            gradient: LinearGradient(
          colors: [
            context.mycolors.bluePinkLight!,
            context.mycolors.bluePinkLight!,
            context.mycolors.bluePinkLight!,
            context.mycolors.bluePinkDark!,
          ],
        )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
        child: const SafeArea(
          bottom: false,
          child: LoginBoody(),
        ),
      ),
    );
  }
}
