import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/admin/categories/data/models/get_all_category/get_all_category_repo_model.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/widgets/category_customer/catgeory_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCustomerList extends StatefulWidget {
  CategoryCustomerList({super.key, this.categories, required this.loading});
  List<GetAllCategoryRepoModel>? categories;

  bool loading;

  @override
  State<CategoryCustomerList> createState() => _CategoryCustomerListState();
}

class _CategoryCustomerListState extends State<CategoryCustomerList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: SizedBox(
        height: 130.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: widget.loading == true ? 10 : widget.categories!.length,
          itemBuilder: (context, index) {
            return widget.loading == true
                ? const CategoryCustomerItem(
                    id: 0,
                    image:
                        "https://static.vecteezy.com/system/resources/previews/000/211/681/original/shopping-sale-banner-neon-vector.jpg",
                    name: "customer",
                  )
                : CategoryCustomerItem(
                    name: widget.categories![index].name,
                    id: widget.categories![index].id,
                    image: widget.categories![index].image,
                  );
          },
        ),
      ),
    );
  }
}
