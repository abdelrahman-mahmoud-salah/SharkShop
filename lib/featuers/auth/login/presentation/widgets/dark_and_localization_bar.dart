import 'package:flutter/material.dart';
import '../../../../../core/app/Appcubit/app_cubit.dart';
import '../../../../../core/common/widget/custom_linear_bottom.dart';
import '../../../../../core/common/widget/text_app.dart';
import '../../../../../core/extension/context_extention.dart';
import '../../../../../core/styles/fonts/font_family.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DarkAndLocalizationBar extends StatelessWidget {
  const DarkAndLocalizationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomLinearButton(
        onPressed: () {
          context.read<AppCubit>().changetheme();
        },
        height: 50.h,
        width: 50.h,
        child: Icon(
          Icons.sunny,
          color: context.mycolors.textColorInButton,
        ),
      ),
      CustomLinearButton(
          onPressed: () {
            context.read<AppCubit>().changelocalization();
          },
          height: 50.h,
          width: 100.h,
          child: TextApp(
            text: context.lang.language,
            theme: context.textStyle.copyWith(
                fontSize: 20.sp,
                color: context.mycolors.textColorInButton,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamilyHelper.geLocalozedFontFamily()),
          ))
    ]);
  }
}
