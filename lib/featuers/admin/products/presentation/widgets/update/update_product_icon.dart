import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:flutter_application_2/core/di/dependency_injection.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/update_product/update_product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common/bottomsheet/custom_bottom_sheet.dart';
import 'update_product_bottom_sheet_view.dart';

// ignore: must_be_immutable
class UpdateProductIcon extends StatelessWidget {
  UpdateProductIcon(
      {super.key,
      required this.image,
      // ignore: non_constant_identifier_names
      this.Title,
      this.price,
      this.description,
      this.category,
      this.categoryId, required this.id});
  List<String> image;
  // ignore: non_constant_identifier_names
  final String? Title;
  final String? price;
  final String? description;
  final String? category;
  final String? categoryId;
  final int id;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          CustomBottomSheet.CustomBottomSheetContainer(
            context: context,
            w: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => sl<UpdateProductBloc>(),
                ),
                BlocProvider(
                  create: (context) => sl<UploadImageCubit>(),
                ),
              ],
              child: UpdateProductBottomSheetView(
                image: image,
                Title: Title,
                category: category,
                description: description,
                price: price,
                id: id,
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.mode_edit_sharp,
          color: Colors.green,
        ));
  }
}
