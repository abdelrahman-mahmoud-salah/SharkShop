import 'package:flutter/material.dart';
import '../../../../../../core/common/widget/custom_button.dart';
import '../../../../../../core/common/widget/custom_drop_down.dart';
import '../../../../../../core/common/widget/text_app.dart';
import '../../../../../../core/common/widget/text_from_field_app.dart';
import '../../../../../../core/extension/context_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProductBottomSheetView extends StatelessWidget {
  UpdateProductBottomSheetView({
    super.key,
    required this.image,
  });
List<String> image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: SingleChildScrollView(
        child: Form(
          key: GlobalKey(),
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
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      height: 90.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(image[index]),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                itemCount: image.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
              ),
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
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                hintText: 'Title',
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
                controller: TextEditingController(),
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
                controller: TextEditingController(),
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                hintText: 'Description',
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
                items: [],
                onChanged: (value) {},
                value: "",
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onPressed: () {},
                backgroundColor: context.mycolors.textColorInButton,
                lastRadius: 20,
                threeRadius: 20,
                textColor: context.mycolors.bluePinkDark,
                text: 'Create Product',
                width: MediaQuery.of(context).size.width,
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
