import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/widget/cutom_container_admin.dart';
import '../../../../../core/common/widget/text_app.dart';
import '../../../../../core/extension/context_extention.dart';
import 'updating_deleting_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsAdminItem extends StatelessWidget {
  const ProductsAdminItem({
    super.key,
   
     this.title,
     this.categoryName,
     this.description,
     this.price,
     this.productId,
     this.categoryId,
     this.image,
  });
  
  final String? title;
  final String? categoryName;
  final String? description;
  final String? price;
  final String? productId;
  final String? categoryId;
  final List<String>? image;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
        height: 300.h,
        width: 165.w,
        child: Column(
          children: [
            EditiingAndUpdateButton(image: image!),
            Flexible(
              child: Center(
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) {
                    return Container(
                        height: 200.h,
                        width: 145.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ));
                  },
                  imageUrl: image![0],
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 70,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: title!,
                theme: context.textStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: context.mycolors.textColorInButton),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: categoryName!,
                theme: context.textStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: context.mycolors.textColorInButton),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5.h),
            // Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: price!,
                theme: context.textStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: context.mycolors.textColorInButton),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ));
  }
}
