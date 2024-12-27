import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app/Appcubit/app_cubit.dart';
import 'package:flutter_application_2/core/app/Appcubit/app_state.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/core/styles/images/app_images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangeLanguageCustomer extends StatelessWidget {
  const ChangeLanguageCustomer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                SvgPicture.asset(
                  AppImages.language,
                  color: context.mycolors.textcolor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                TextApp(
                    text: context.lang.language_tilte,
                    theme: context.textStyle.copyWith(
                        color: context.mycolors.textcolor,
                        fontWeight: FontWeight.normal,
                        fontSize: 25.sp)),
              ],
            ),
            InkWell(
              onTap: () {
                context.read<AppCubit>().changelocalization();
              },
              child: Row(
                children: [
                  TextApp(
                      text: context.lang.lang_code,
                      theme: context.textStyle.copyWith(
                          color: context.mycolors.textcolor,
                          fontWeight: FontWeight.normal,
                          fontSize: 20.sp)),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: context.mycolors.textcolor,
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}