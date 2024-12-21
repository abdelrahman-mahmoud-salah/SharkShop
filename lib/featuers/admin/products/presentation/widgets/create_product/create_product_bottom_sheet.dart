import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/create_product/custom_create_button.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/create_product/list_of_category.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/create_product/upload_list_of_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common/widget/text_app.dart';
import '../../../../../../core/common/widget/text_from_field_app.dart';
import '../../../../../../core/extension/context_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateProductBottomSheetView extends StatelessWidget {
  const CreateProductBottomSheetView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  final bloc=  context.read<AllProductBloc>();
    return SizedBox(
      height: 600,
      child: SingleChildScrollView(
        child: Form(
          key: GlobalKey(),
          child: Column(
            children: [
              Center(
                child: TextApp(
                  text: 'Create Product',
                  theme: context.textStyle.copyWith(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: context.mycolors.textColorInButton),
                ),
              ),
              SizedBox(height: 20.h),
              TextApp(
                text: 'Create a photos',
                theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
              ),
              SizedBox(height: 15.h),
         const  ListOfImageViewAndLogic(),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Title',
                theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
              ),
              SizedBox(height: 15.h),
              // Title
              CustomTextField(
                controller:bloc.titleController ,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Title',
                hintStyle: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 2) {
                    return 'Please Selected Your Product Title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Price',
                theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
              ),
              SizedBox(height: 15.h),
              // Price
              CustomTextField(
                controller: bloc.priceController,
                keyboardType: TextInputType.number,
                hintText: 'Price',
                hintStyle: context.textStyle.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Selected Your Product Price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Description',
                theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
              ),
              SizedBox(height: 15.h),
              //Description
              CustomTextField(
                controller: bloc.descriptionController,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                hintText: 'Description',
                hintStyle: context.textStyle.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 2) {
                    return 'Please Selected Your Product description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Category',
                theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
              ),
              SizedBox(height: 15.h),
            const  ListOfCategory(),
              SizedBox(
                height: 20.h,
              ),
             const customCreateProductButton(),
            ],
          ),
        ),
      ),
    );
  }
}

