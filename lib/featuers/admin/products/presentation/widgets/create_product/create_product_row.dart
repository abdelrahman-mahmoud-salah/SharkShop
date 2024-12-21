import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:flutter_application_2/core/di/dependency_injection.dart';
import 'package:flutter_application_2/featuers/admin/categories/presentation/blocs/get_all_category_bloc/getallcategory_bloc.dart';
import 'package:flutter_application_2/featuers/admin/categories/presentation/blocs/get_all_category_bloc/getallcategory_event.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common/bottomsheet/custom_bottom_sheet.dart';
import '../../../../../../core/common/widget/custom_linear_bottom.dart';
import '../../../../../../core/common/widget/text_app.dart';
import '../../../../../../core/extension/context_extention.dart';
import 'create_product_bottom_sheet.dart';
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
                w: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => sl<UploadImageCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => sl<AllProductBloc>(),
                    ),
                    BlocProvider(
                      create: (context) => sl<GetallcategoryBloc>()
                        ..add(const GetallcategoryEvent.getAllCategry(
                            isloading: false)),
                    ),
                  ],
                  child: const CreateProductBottomSheetView(),
                ),
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
