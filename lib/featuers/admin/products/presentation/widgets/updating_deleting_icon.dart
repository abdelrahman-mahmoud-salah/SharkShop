import 'package:flutter/material.dart';
import 'delete/delete__product_icon.dart';
import 'update/update_product_icon.dart';

class EditiingAndUpdateButton extends StatelessWidget {
  EditiingAndUpdateButton(
      {super.key,
      required this.image,
      this.Title,
      this.price,
      this.description,
      this.category,
      this.categoryId, required this.id});
  List<String> image;
  final String? Title;
  final String? price;
  final String? description;
  final String? category;
  final String? categoryId;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DeleteProductIcon(id: id.toString(),),
        UpdateProductIcon(
          image: image,
          Title: Title,
          category: category,
          categoryId: categoryId,
          description: description,
          price: price,
          id: id,
        ),
      ],
    );
  }
}
