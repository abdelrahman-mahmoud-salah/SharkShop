import 'package:flutter/material.dart';
import '../../extension/context_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class ErrorScreen extends StatelessWidget {
   ErrorScreen({
    super.key,
    this.onRefresh
  });
Future<void> Function()? onRefresh;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.h),
        child: RefreshIndicator(
          onRefresh: onRefresh ?? ()async{ },
          child: Column(
            children: [
              Lottie.asset("assets/json/Animation - 1733942032503.json",height: 200.h),
              SizedBox(
          height: 50.h,
                ),
               Text(
                'Error occurred while fetching data',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: context.mycolors.textColorInButton!.withOpacity(.4)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

