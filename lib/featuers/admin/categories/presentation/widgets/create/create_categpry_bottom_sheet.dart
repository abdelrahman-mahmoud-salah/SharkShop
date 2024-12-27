import 'package:flutter/material.dart';
import '../../../../../../core/app/upload_image/cubit/upload_image_cubit.dart';
import '../../../../../../core/common/widget/custom_button.dart';
import '../../../../../../core/common/widget/text_app.dart';
import '../../../../../../core/common/widget/text_from_field_app.dart';
import '../../../../../../core/extension/context_extention.dart';
import '../../blocs/create_categoy/create_category_bloc.dart';
import 'crate_category_bottom.dart';
import 'upload_category_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateCategoryBottomSheetWidget extends StatelessWidget {
  const CreateCategoryBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<CreateCategoryBloc>().key,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: TextApp(
              text: "${context.lang.add} ${context.lang.categories}",
              theme: context.textStyle.copyWith(
                  color: context.mycolors.textColorInButton,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextApp(
                text: context.lang.add_a_photo,
                theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: context.mycolors.textColorInButton)),
            context.read<UploadImageCubit>().getImageUrl.isNotEmpty
                ? CustomButton(
                    onPressed: () {},
                    text: context.lang.remove,
                    width: 120.w,
                    height: 35.h,
                    lastRadius: 10,
                    threeRadius: 10,
                    backgroundColor: Colors.red,
                  )
                : const SizedBox.shrink()
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        const UploadImageCategory(),
        SizedBox(
          height: 25.h,
        ),
        TextApp(
            textAlign: TextAlign.start,
            text: context.lang.enter_name_category,
            theme: context.textStyle.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: context.mycolors.textColorInButton)),
        SizedBox(
          height: 15.h,
        ),
        CustomTextField(
          controller: context.read<CreateCategoryBloc>().nameController,
          keyboardType: TextInputType.name,
          hintText: context.lang.categor_name,
          hintStyle: context.textStyle.copyWith(
              color: context.mycolors.textColorInButton,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
          validator: (p0) {
            if (p0!.isEmpty || p0.length > 6) {
              return context.lang.valid_name;
            }
            return null;
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        const CreateCategoryButtom(),
        SizedBox(
          height: 15.h,
        ),
      ]),
    );
  }
}
