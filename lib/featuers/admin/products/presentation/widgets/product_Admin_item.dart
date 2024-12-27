
import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/cashed_network_image.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/text_item_product.dart';
import '../../../../../core/common/widget/cutom_container_admin.dart';
import 'updating_deleting_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsAdminItem extends StatelessWidget {
  const ProductsAdminItem({
    super.key,
    this.title,
    this.categoryName,
    this.description,
    this.price,

    this.categoryId,
    this.image, required this.productId,
  });

  final String? title;
  final String? categoryName;
  final String? description;
  final String? price;
  final int productId;
  final String? categoryId;
  final List<String>? image;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
        height: 300.h,
        width: 165.w,
        child: Column(
          children: [
            EditiingAndUpdateButton(
              image: image!,
              Title: title,
              category: categoryName,
              description: description,
              price: price,
              id: productId,
            ),
            Flexible(
              child: Center(
                child: CashedImage(image: image),
              ),
            ),
            SizedBox(height: 10.h),
            // title
            TextItemProduct(text: title),
            SizedBox(height: 5.h),
            TextItemProduct(text: categoryName),
            SizedBox(height: 5.h),
            // Price
            TextItemProduct(text: price),
            SizedBox(height: 10.h),
          ],
        ));
  }
}




