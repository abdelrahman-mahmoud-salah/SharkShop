import 'package:flutter/material.dart';

import '../../../../../../core/app/upload_image/cubit/upload_image_cubit.dart';
import '../../../../../../core/common/widget/custom_button.dart';
import '../../../../../../core/common/widget/text_app.dart';
import '../../../../../../core/common/widget/text_from_field_app.dart';
import '../../../../../../core/extension/context_extention.dart';
import '../../blocs/update_category/update_category_bloc.dart';
import 'update_image_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateCategoryView extends StatefulWidget {
  const UpdateCategoryView({super.key, required this.id, required this.image});
  final String id;
  final String image;

  @override
  State<UpdateCategoryView> createState() => _UpdateCategoryViewState();
}

class _UpdateCategoryViewState extends State<UpdateCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<UpdateCategoryBloc>().key,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: TextApp(
              text: context.lang.update_category,
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
        UpdateImageCategory(
          image: widget.image,
        ),
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
          controller: context.read<UpdateCategoryBloc>().nameController,
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
        SizedBox(
          height: 15.h,
        ),
      ]),
    );
  }
}
