import 'package:flutter/material.dart';

import '../../../../../core/extension/context_extention.dart';
import '../../../login/presentation/widgets/shape_of_bottom_navigator_bar.dart';
import 'sign_up_boody.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
        child: const SingleChildScrollView(
          child: SafeArea(
            bottom: false,
            child: SignUpBoody(),
          ),
        ),
      ),
    );
  }
}
