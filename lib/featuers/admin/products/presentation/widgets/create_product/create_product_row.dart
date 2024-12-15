import 'package:flutter/material.dart';
import '../../../../../../core/common/bottomsheet/custom_bottom_sheet.dart';
import '../../../../../../core/common/widget/custom_button.dart';
import '../../../../../../core/common/widget/custom_drop_down.dart';

import '../../../../../../core/common/widget/custom_linear_bottom.dart';
import '../../../../../../core/common/widget/text_app.dart';
import '../../../../../../core/common/widget/text_from_field_app.dart';
import '../../../../../../core/extension/context_extention.dart';
import 'create_product_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({
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
            onPressed: () {
              CustomBottomSheet.CustomBottomSheetContainer(
                context: context,
                w: const CreateProductBottomSheetView(),
                whenComplete: () {},
              );
            },
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
