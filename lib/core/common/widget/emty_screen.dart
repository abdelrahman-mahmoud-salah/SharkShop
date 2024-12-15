import 'package:flutter/material.dart';
import 'text_app.dart';
import '../../extension/context_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.h),
        child: Column(
          children: [
            Lottie.asset("assets/json/Animation - 1733941490163.json"),
            SizedBox(
              height: 50.h,
            ),
            TextApp(
                text:title ,
                theme: context.textStyle.copyWith(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: context.mycolors.textColorInButton,
                ))
          ],
        ),
      ),
    );
  }
}

