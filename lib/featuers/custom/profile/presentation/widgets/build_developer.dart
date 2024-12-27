import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/core/routes/routes_app_const.dart';
import 'package:flutter_application_2/core/styles/images/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuildDeveloper extends StatelessWidget {
  const BuildDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16.w,
        ),
        SvgPicture.asset(
          AppImages.buildDeveloper,
          color: context.mycolors.textcolor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.lang.build_developer,
          theme: context.textStyle.copyWith(
              fontSize: 23.sp,
              fontWeight: FontWeight.w400,
              color: context.mycolors.textColorInButton),
        ),
        const Spacer(),
        //language button
        InkWell(
          onTap: () {
            //Open Web View
            context.pushNamed(
              pageName: RoutesAppConst.webView,
              arg: "https://github.com/abdelrahman-mahmoud-salah",
            );
          },
          child: Row(
            children: [
              TextApp(
                text: 'Abdo Mahmoud',
                theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: context.mycolors.textColorInButton),
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.arrow_forward_ios,
                color: context.mycolors.textcolor,
                size: 25,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
