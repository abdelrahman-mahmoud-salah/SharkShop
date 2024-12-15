import 'package:flutter/material.dart';
import '../../../../../core/common/widget/cutom_container_admin.dart';
import '../../../../../core/common/widget/text_app.dart';
import '../../../../../core/extension/context_extention.dart';
import '../../../../../core/loading/shimmer_loading.dart';
import '../../../../../core/styles/fonts/font_family.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardContiner extends StatelessWidget {
  const DashBoardContiner({
    required this.title,
    required this.number,
    required this.image,
    required this.isLoading,
    super.key,
  });

  final String title;
  final String number;
  final String image;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextApp(
                  text: title,
                  theme: context.textStyle.copyWith(
                    fontSize: 24.sp,
                    color: context.mycolors.textColorInButton,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                  ),
                ),
                const Spacer(),
                if (isLoading)
                  LoadingShimmer(height: 30.h, width: 100.w)
                else
                  TextApp(
                    text: number,
                    theme: context.textStyle.copyWith(
                      color: context.mycolors.textColorInButton,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                    ),
                  ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: 100.h,
              width: 80.w,
              child: Image.asset(image),
            )
          ],
        ),
      ),
    );
  }
}
