import 'package:flutter/material.dart';
import '../../../categories/presentation/blocs/get_all_category_bloc/getallcategory_bloc.dart';
import '../../../categories/presentation/blocs/get_all_category_bloc/getallcategory_event.dart';
import '../blocs/productNumber/product_number_bloc.dart';
import '../blocs/productNumber/product_number_event.dart';
import '../widgets/function/all_category_number.dart';
import '../widgets/function/all_product_number__logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashBoardBoody extends StatelessWidget {
  const DashBoardBoody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: RefreshIndicator(
        onRefresh: () async {
          context
              .read<ProductNumberBloc>()
              .add(const ProductsNumberEvent.getProductsNumber());
          context
              .read<GetallcategoryBloc>()
              .add(const GetallcategoryEvent.getAllCategry(isloading: true));
        },
        child: ListView(
          children: [
            allProductNumber(),
            SizedBox(
              height: 20.h,
            ),
            allCategoryNumber(),
          ],
        ),
      ),
    );
  }
}
