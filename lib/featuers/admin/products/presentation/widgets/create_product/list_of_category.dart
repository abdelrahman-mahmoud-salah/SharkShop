import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/custom_drop_down.dart';
import 'package:flutter_application_2/featuers/admin/categories/presentation/blocs/get_all_category_bloc/getallcategory_bloc.dart';
import 'package:flutter_application_2/featuers/admin/categories/presentation/blocs/get_all_category_bloc/getallcategory_state.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfCategory extends StatefulWidget {
  const ListOfCategory({
    super.key,
  });

  @override
  State<ListOfCategory> createState() => _ListOfCategoryState();
}

class _ListOfCategoryState extends State<ListOfCategory> {
  String? category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetallcategoryBloc, GetallcategoryState>(
      builder: (context, state) {
        if (state.state == GetallcategoryStateValue.success) {
          return CustomCreateDropDown(
            hintText: "Category",
            items: state.categories!.map((e) => e.name ?? '').toSet().toList(),
            onChanged: (value) {
              setState(() {
                category = value;
              });
              context.read<AllProductBloc>().categoryId = state.categories!
                  .firstWhere(
                    (e) => e.name == value,
                  )
                  .id;
            },
            value: category,
          );
        } else {
          return CustomCreateDropDown(
            hintText: "Category",
            items: const [],
            onChanged: (value) {},
            value: "",
          );
        }
      },
    );
  }
}
