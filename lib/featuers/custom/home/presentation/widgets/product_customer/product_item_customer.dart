import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/cutom_container_admin.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/cashed_network_image.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/text_item_product.dart';
import 'package:flutter_application_2/featuers/custom/favourite/presentation/blocs/cubit/favourites_cubit.dart';
import 'package:flutter_application_2/featuers/custom/favourite/presentation/blocs/cubit/favourites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsCustomerItem extends StatelessWidget {
  const ProductsCustomerItem({
    super.key,
    this.title,
    this.categoryName,
    this.description,
    this.price,
    this.categoryId,
    this.image,
    required this.productId,
  });

  final String? title;
  final String? categoryName;
  final String? description;
  final String? price;
  final int productId;
  final int? categoryId;
  final List<String>? image;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
        height: 0,
        width: 0.w,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ShareIcon(),
                FavoriteIcon(
                  productId: productId,
                  categoryId: categoryId,
                  categoryName: categoryName,
                  description: description,
                  image: image,
                  price: price,
                  title: title,
                )
              ],
            ),
            Flexible(
              child: Center(
                child: CashedImage(
                  image: image,
                  width: 156.h,
                  radius: 10.spMax,
                ),
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

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    this.title,
    this.categoryName,
    this.description,
    this.price,
    this.categoryId,
    this.image,
    required this.productId,
  });
  final String? title;
  final String? categoryName;
  final String? description;
  final String? price;
  final int productId;
  final int? categoryId;
  final List<String>? image;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              context.read<FavouritesCubit>().managementFavourites(
                    productId: productId.toString(),
                    categoryName: categoryName,
                    description: description,
                    image: image![0],
                    price: price,
                    title: title,
                  );
            },
            icon: context
                    .read<FavouritesCubit>()
                    .isFavorites(productId.toString())
                ? Icon(
                    Icons.favorite,
                    color: context.mycolors.bluePinkLight,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: context.mycolors.textColorInButton,
                  ));
      },
    );
  }
}

class ShareIcon extends StatelessWidget {
  const ShareIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.share,
          color: context.mycolors.textColorInButton,
        ));
  }
}
