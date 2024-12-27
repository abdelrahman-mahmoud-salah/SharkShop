import 'package:flutter/material.dart';
import '../../../../../core/common/widget/text_app.dart';
import '../../../../../core/extension/context_extention.dart';
import '../../../../../core/styles/fonts/font_family.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextApp(
        text: context.lang.sign_up,
        textAlign: TextAlign.center,
        theme: context.textStyle.copyWith(
            color: context.mycolors.textcolor,
            fontSize: 26.sp,
            fontFamily: FontFamilyHelper.geLocalozedFontFamily()),
      ),
      subtitle: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: TextApp(
          text: context.lang.sign_up_welcome,
          textAlign: TextAlign.center,
          theme: context.textStyle.copyWith(
              color: context.mycolors.textcolor!.withOpacity(.8),
              fontSize: 18.sp,
              fontFamily: FontFamilyHelper.geLocalozedFontFamily()),
          softWrap: false,
        ),
      ),
    );
  }
}
