import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app/Appcubit/app_cubit.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/core/styles/images/app_images.dart';
import 'package:flutter_application_2/core/utils/app_info.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/pages/profile_cusromer_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuildVersion extends StatelessWidget {
  const BuildVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16.w,
        ),
        SvgPicture.asset(
          AppImages.buildVersion,
          color: context.mycolors.textColorInButton,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.lang.build_version,
          theme: context.textStyle.copyWith(
              fontSize: 25.sp,
              fontWeight: FontWeight.w400,
              color: context.mycolors.textColorInButton),
        ),
        const Spacer(),
        //Build Version
        FutureBuilder<String>(
          future: AppInfo.getAppVersion(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: context.read<AppCubit>().english
                    ? EdgeInsets.only(right: 10.w)
                    : EdgeInsets.only(left: 10.w),
                child: TextApp(
                  text: snapshot.data.toString(),
                  theme: context.textStyle.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: context.mycolors.textColorInButton),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
