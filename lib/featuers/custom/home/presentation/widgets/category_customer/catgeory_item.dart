import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/custom_container_linear_customer.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/categories/data/models/get_all_category/get_all_category_repo_model.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_category_bloc/getallcategory_bloc.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_product/get_all_product_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCustomerItem extends StatelessWidget {
  const CategoryCustomerItem({
    super.key,
    required this.id,
    this.name,
    this.image,
  });
  final int id;
  final String? name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.read<AllProductCustomerBloc>().categoryId = id;
            context.read<AllProductCustomerBloc>()
              ..add(GetAllProductCustomer(TypeStatus: "s", idCategory: id));
          },
          child: CustomContainerLinearCustomer(
            height: 71.h,
            width: 71.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.fill,
                height: 71.h,
                width: 71.w,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          height: 35.h,
          width: 75.w,
          child: TextApp(
            text: name!,
            maxLines: 1,
            softWrap: true,
            textOverflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            theme: context.textStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: context.mycolors.textColorInButton),
          ),
        ),
      ],
    );
  }
}
