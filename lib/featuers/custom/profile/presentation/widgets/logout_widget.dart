import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/dialogs/custom_dialogs.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/core/styles/images/app_images.dart';
import 'package:flutter_application_2/core/utils/app_logout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 16.w,
        ),
        SvgPicture.asset(
          AppImages.logout,
          color: context.mycolors.textColorInButton,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.lang.log_out,
          theme: context.textStyle.copyWith(
            fontSize: 25.sp,
            fontWeight: FontWeight.w400,
            color: context.mycolors.textColorInButton,
          ),
        ),
        const Spacer(),
        //language button
        InkWell(
          onTap: () {
            //dialog
            CustomDialog.twoButtonDialog(
              context: context,
              textBody: context.lang.log_out_from_app,
              textButton1: context.lang.yes,
              textButton2: context.lang.no,
              isLoading: false,
              onPressed: () async {
                
                await AppLogout().logout();
              },
            );
          },
          child: Row(
            children: [
              TextApp(
                text: context.lang.log_out.toLowerCase(),
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: context.mycolors.textColorInButton,
                ),
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.arrow_forward_ios,
                color: context.mycolors.textColorInButton,
                size: 25,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
