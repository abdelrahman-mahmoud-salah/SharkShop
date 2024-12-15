import 'package:flutter/material.dart';
import '../../../../../core/common/widget/custom_linear_bottom.dart';
import '../../../../../core/common/widget/text_app.dart';
import '../../../../../core/extension/context_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomLinearButton(
      onPressed: () {},
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      child: TextApp(
          textAlign: TextAlign.center,
          text: context.lang.sign_up,
          theme: context.textStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: context.mycolors.textColorInButton)),
    );
  }
}
