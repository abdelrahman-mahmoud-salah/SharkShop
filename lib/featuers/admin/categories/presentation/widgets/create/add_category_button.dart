import 'package:flutter/material.dart';
import '../../../../../../core/app/upload_image/cubit/upload_image_cubit.dart';
import '../../../../../../core/common/bottomsheet/custom_bottom_sheet.dart';
import '../../../../../../core/common/widget/custom_linear_bottom.dart';
import '../../../../../../core/common/widget/text_app.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/extension/context_extention.dart';
import '../../blocs/create_categoy/create_category_bloc.dart';
import '../../blocs/get_all_category_bloc/getallcategory_bloc.dart';
import '../../blocs/get_all_category_bloc/getallcategory_event.dart';
import 'create_categpry_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            text: context.lang.allcategories,
            theme: context.textStyle.copyWith(
                color: context.mycolors.textColorInButton!.withOpacity(.9),
                fontSize: 23.sp,
                fontWeight: FontWeight.w500)),
        CustomLinearButton(
            onPressed: () {
              CustomBottomSheet.CustomBottomSheetContainer(
                context: context,
                w: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => sl<CreateCategoryBloc>(),
                    ),
                    BlocProvider(
                      create: (context) => sl<UploadImageCubit>(),
                    ),
                  ],
                  child: const CreateCategoryBottomSheetWidget(),
                ),
                whenComplete: () {
                  context.read<GetallcategoryBloc>().add(
                        const GetallcategoryEvent.getAllCategry(
                            isloading: false),
                      );
                },
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
