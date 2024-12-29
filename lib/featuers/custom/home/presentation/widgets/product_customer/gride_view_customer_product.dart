// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/get_all_product/product_repo_model.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/pages/home_customer_screen_boody.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/widgets/product_customer/product_item_customer.dart';

class GrideViewCustomerProduct extends StatefulWidget {
  GrideViewCustomerProduct({super.key, required this.products, this.loading});

  List<ProductRepoModel> products;
  bool? loading = false;

  @override
  State<GrideViewCustomerProduct> createState() =>
      _GrideViewCustomerProductState();
}

class _GrideViewCustomerProductState extends State<GrideViewCustomerProduct> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.loading == true ? 10 : widget.products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //Number of cloums
        crossAxisSpacing: 8, // Spacing between colums
        mainAxisSpacing: 15, //Spacing between rows
        childAspectRatio: 200 / 350,
      ),
      itemBuilder: (context, index) {
        return widget.loading == true
            ? const ProductsCustomerItem(
                productId: 0,
                categoryId: 000,
                categoryName: "nmnmbnmbn",
                description: "x,xx",
                image: [
                  "https://static.vecteezy.com/system/resources/previews/000/211/681/original/shopping-sale-banner-neon-vector.jpg",
                ],
                price: "000",
                title: "sadns",
              )
            : ProductsCustomerItem(
                productId: widget.products[index].id,
                categoryId: widget.products[index].category!.id,
                categoryName: widget.products[index].category!.name,
                description: widget.products[index].description,
                image: widget.products[index].images,
                price: widget.products[index].price.toString(),
                title: widget.products[index].title,
              );
      },
    );
  }
}
