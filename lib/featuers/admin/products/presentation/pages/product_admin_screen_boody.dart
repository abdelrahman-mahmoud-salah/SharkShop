import 'package:flutter/material.dart';
import '../blocs/get_all_product/get_all_product_bloc.dart';
import '../blocs/get_all_product/get_all_product_event.dart';
import '../blocs/get_all_product/get_all_product_state.dart';
import '../widgets/create_product/create_product_row.dart';
import '../widgets/product_Admin_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductAdminScreenBoody extends StatelessWidget {
  const ProductAdminScreenBoody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const AddProductButton(),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context
                    .read<GetAllProductBloc>()
                    .add(GetAllProductEvent.getAllProducts());
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllProductBloc, GetAllProductState>(
                      builder: (context, state) {
                        if (state.status == GetAllProductStateValues.loading) {
                          return Skeletonizer(
                            enabled: true,
                            switchAnimationConfig:
                                const SwitchAnimationConfig(),
                            enableSwitchAnimation: true,
                            ignoreContainers: true,
                            ignorePointers: true,
                            justifyMultiLineText: true,
                            effect: const ShimmerEffect(
                                duration: Durations.extralong2),
                            child: GridView.builder(
                              itemCount: 6,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, //Number of cloums
                                crossAxisSpacing:
                                    20.w, // Spacing between colums
                                mainAxisSpacing: 30.h, //Spacing between rows
                                childAspectRatio: 165 / 300,
                              ),
                              itemBuilder: (context, index) {
                                return const ProductsAdminItem(
                                    categoryId: "Favorite  ",
                                    productId: "Favorite  ",
                                    title: "Favorite  ",
                                    price: "Favorite  ",
                                    categoryName: "Favorite  ",
                                    image: [
                                      "https://flutternewshub.com/storage/images/posts/01HQMGRT27T9BMCVSFXZDDZYFW.webp"
                                    ],
                                    description: "ppppp ");
                              },
                            ),
                          );
                        } else if (state.status ==
                            GetAllProductStateValues.success) {
                          return GridView.builder(
                            itemCount: state.products!.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, //Number of cloums
                              crossAxisSpacing: 20.w, // Spacing between colums
                              mainAxisSpacing: 30.h, //Spacing between rows
                              childAspectRatio: 165 / 300,
                            ),
                            itemBuilder: (context, index) {
                              return ProductsAdminItem(
                                categoryId: state.products![index].category!.id
                                    .toString(),
                                productId: state.products![index].id.toString(),
                                title: state.products![index].title,
                                price: state.products![index].price!.toString(),
                                categoryName:
                                    state.products![index].category!.name,
                                image: state.products![index].images,
                                description: state.products![index].description,
                              );
                            },
                          );
                        } else if (state.status ==
                            GetAllProductStateValues.error) {
                          return Center(
                              child: Text(
                                  'An error occurred while fetching products ${state.errorMessage}'));
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 25.h,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
