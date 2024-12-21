import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextItemProduct extends StatelessWidget {
  const TextItemProduct({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextApp(
        text: text!,
        textAlign: TextAlign.center,
        theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: context.mycolors.textColorInButton),
        maxLines: 1,
      ),
    );
  }
}