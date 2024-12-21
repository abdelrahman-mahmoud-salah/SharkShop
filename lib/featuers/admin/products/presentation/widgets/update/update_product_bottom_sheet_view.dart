import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/update_product/update_product_bloc.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/update/update_list_image.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/update/update_product_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common/widget/custom_drop_down.dart';
import '../../../../../../core/common/widget/text_app.dart';
import '../../../../../../core/common/widget/text_from_field_app.dart';
import '../../../../../../core/extension/context_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class UpdateProductBottomSheetView extends StatelessWidget {
  UpdateProductBottomSheetView({
    super.key,
    required this.image,
    // ignore: non_constant_identifier_names
    this.Title,
    this.price,
    this.description,
    this.category,
    required this.id,
  });
  List<String> image;
  // ignore: non_constant_identifier_names
  final String? Title;
  final String? price;
  final String? description;
  final String? category;
  final int id;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UpdateProductBloc>();
    bloc.titleController.text = Title!;
    bloc.priceController.text = price!;
    bloc.descriptionController.text = description!;
    bloc.lisImages = image;
    return SizedBox(
      height: 600,
      child: SingleChildScrollView(
        child: Form(
          key: bloc.fromKey,
          child: Column(
            children: [
              Center(
                child: TextApp(
                  text: 'update Product',
                  theme: context.textStyle.copyWith(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: context.mycolors.textColorInButton),
                ),
              ),
              SizedBox(height: 20.h),
              TextApp(
                text: 'ubdate a photos',
                theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
              ),
              SizedBox(height: 15.h),
              UpdateListOfImages(image: image),
              SizedBox(height: 15.h),
              TextApp(
                text: 'update Title',
                theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
              ),
              SizedBox(height: 15.h),
              // Title
              CustomTextField(
                controller: bloc.titleController,
                keyboardType: TextInputType.emailAddress,
                hintText: Title,
                hintStyle: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
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
                controller:bloc.priceController,
                keyboardType: TextInputType.number,
                hintText: price,
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
                hintText: description,
                hintStyle: context.textStyle.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: context.mycolors.textColorInButton),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
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
              CustomCreateDropDown(
                hintText: "Category",
                items: [category!],
                onChanged: (value) {},
                value: category,
              ),
              SizedBox(
                height: 20.h,
              ),
              UpdateProductButton(
                id: id,
              ),
            ],
          ),
        ),
      ),
    );
    
  }
  
}
