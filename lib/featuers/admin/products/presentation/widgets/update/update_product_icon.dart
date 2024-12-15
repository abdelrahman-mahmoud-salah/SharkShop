import 'package:flutter/material.dart';
import '../../../../../../core/common/bottomsheet/custom_bottom_sheet.dart';
import 'ubdate_product_bottom_sheet_view.dart';

class UpdateProductIcon extends StatelessWidget {
   UpdateProductIcon({
    super.key,
    required this.image
  });
List<String> image;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          CustomBottomSheet.CustomBottomSheetContainer(
            context: context,
            w:  UpdateProductBottomSheetView(image:image),
          );
        },
        icon: const Icon(
          Icons.mode_edit_sharp,
          color: Colors.green,
        ));
  }
}
