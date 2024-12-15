import 'package:flutter/material.dart';
import 'delete/delete__product_icon.dart';
import 'update/update_product_icon.dart';

class EditiingAndUpdateButton extends StatelessWidget {
  EditiingAndUpdateButton({super.key, required this.image});
  List<String> image;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DeleteProductIcon(),
        UpdateProductIcon(image: image,),
      ],
    );
  }
}
