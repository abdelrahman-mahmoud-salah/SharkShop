import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TitelRowTable extends StatelessWidget {
  TitelRowTable(
      {super.key, this.fontSize, required this.icon, required this.text});
  final IconData icon;
  final String text;
  double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: [
          Icon(
            icon,
            color: context.mycolors.textColorInButton,
            size: 20.sp,
          ),
          SizedBox(
            width: 5.w,
          ),
          TextApp(
              text: text,
              theme: context.textStyle.copyWith(
                  color: context.mycolors.textColorInButton,
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize ?? 15.sp))
        ],
      ),
    );
  }
}
