import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/widgets/product_customer/product_item_customer.dart';

class FavouriteCustomerScreen extends StatelessWidget {
  const FavouriteCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Number of cloums
              crossAxisSpacing: 8, // Spacing between colums
              mainAxisSpacing: 15, //Spacing between rows
              childAspectRatio: 200 / 350,
            ),
            itemBuilder: (context, index) {
              return const ProductsCustomerItem(
                productId: 0,
                categoryId: 000,
                categoryName: "nmnmbnmbn",
                description: "x,xx",
                image: [
                  "https://static.vecteezy.com/system/resources/previews/000/211/681/original/shopping-sale-banner-neon-vector.jpg",
                ],
                price: "000",
                title: "sadns",
              );
            },
          ),
        )
      ],
    );
  }
}
