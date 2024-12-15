import 'package:flutter/material.dart';
import '../../../../../../core/common/widget/text_app.dart';
import '../../../../../../core/extension/context_extention.dart';
import '../../blocs/productNumber/product_number_bloc.dart';
import '../../blocs/productNumber/product_number_state.dart';
import '../dash_board_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


BlocBuilder<ProductNumberBloc, ProductNumberState> allProductNumber() {
  return BlocBuilder<ProductNumberBloc, ProductNumberState>(
    builder: (context, state) {
      if (state.status == ProductStatus.Loading) {
        return DashBoardContiner(
          isLoading: true,
          number: "",
          title: context.lang.products,
          image: "assets/images/admin/products_drawer.png",
        );
      } else if (state.status == ProductStatus.Success) {
        return DashBoardContiner(
          isLoading: false,
          number: state.numberOfProducts.toString(),
          title: context.lang.products,
          image: "assets/images/admin/products_drawer.png",
        );
      } else if (state.status == ProductStatus.Error) {
        return AlertDialog(
          backgroundColor: context.mycolors.textColorInButton,
          title: Text(context.lang.error),
          content: TextApp(
              text: state.errorMessage!,
              theme: context.textStyle
                  .copyWith(color: context.mycolors.mainColor)),
        );
      }
      return SizedBox.shrink();
    },
  );
}
