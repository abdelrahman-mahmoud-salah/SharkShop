import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/custom/favourite/presentation/blocs/cubit/favourites_cubit.dart';
import 'package:flutter_application_2/featuers/custom/favourite/presentation/blocs/cubit/favourites_state.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/widgets/product_customer/product_item_customer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteCustomerScreen extends StatelessWidget {
  const FavouriteCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const CustomScrollView(
        slivers: [FavouriteCustomerBoody()],
      ),
    );
  }
}

class FavouriteCustomerBoody extends StatelessWidget {
  const FavouriteCustomerBoody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (context.read<FavouritesCubit>().favoritesLis.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              heightFactor: 4.5.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border_outlined,
                    color: context.mycolors.textColorInButton,
                    size: 50.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextApp(
                      text: context.lang.empty_favorite,
                      theme: context.textStyle.copyWith(
                        color: context.mycolors.textColorInButton,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        textBaseline: TextBaseline.alphabetic,
                      ))
                ],
              ),
            ),
          );
        }
        return SliverToBoxAdapter(
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: context.read<FavouritesCubit>().favoritesLis.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Number of cloums
              crossAxisSpacing: 20, // Spacing between colums
              mainAxisSpacing: 20, //Spacing between rows
              childAspectRatio: 200 / 350,
            ),
            itemBuilder: (context, index) {
              return ProductsCustomerItem(
                productId: int.parse(state.favourites![index].id),
                categoryId: int.parse(state.favourites![index].id),
                categoryName: state.favourites![index].categoryName,
                description: state.favourites![index].description,
                image: [
                  state.favourites![index].image,
                ],
                price: state.favourites![index].price,
                title: state.favourites![index].title,
              );
            },
          ),
        );
      },
    );
  }
}
