import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app/Appcubit/app_cubit.dart';
import 'package:flutter_application_2/core/app/Appcubit/app_state.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/core/styles/images/app_images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangeThemeCustomer extends StatelessWidget {
  const ChangeThemeCustomer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cubit = context.read<AppCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                SvgPicture.asset(
                  AppImages.darkMode,
                  color: context.mycolors.textcolor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                TextApp(
                    text: context.lang.dark_mode,
                    theme: context.textStyle.copyWith(
                        color: context.mycolors.textcolor,
                        fontWeight: FontWeight.normal,
                        fontSize: 25.sp)),
              ],
            ),
            const Spacer(),
            Transform.scale(
              scale: 1.2,
              child: Switch.adaptive(
                value: cubit.dark,
                activeColor: const Color.fromARGB(255, 51, 255, 58),
                inactiveTrackColor: const Color(0xff262626),
                onChanged: (value) {
                  cubit.changetheme();
                },
              ),
            ),
            SizedBox(
              width: 5.h,
            )
          ],
        );
      },
    );
  }
}
