import 'package:flutter/material.dart';
import '../../../../../core/common/widget/custom_linear_bottom.dart';
import '../../../../../core/common/widget/text_app.dart';
import '../../../../../core/extension/context_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryButton extends StatelessWidget {
  const AddCategoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
            text: context.lang.allproducts,
            theme: context.textStyle.copyWith(
                color: context.mycolors.textColorInButton!.withOpacity(.9),
                fontSize: 23.sp,
                fontWeight: FontWeight.w500)),
        CustomLinearButton(
            onPressed: () {},
            height: 40.h,
            width: 90.w,
            child: TextApp(
                text: context.lang.add,
                theme: context.textStyle.copyWith(
                    color: context.mycolors.textColorInButton!.withOpacity(.99),
                    fontSize: 23.sp,
                    fontWeight: FontWeight.bold)))
      ],
    );
  }
}
