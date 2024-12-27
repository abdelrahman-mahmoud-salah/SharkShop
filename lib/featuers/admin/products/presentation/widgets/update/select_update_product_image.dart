import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extension/string_exetension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeletetUpdateYourProductImage extends StatelessWidget {
  const SeletetUpdateYourProductImage({
    required this.index,
    required this.onTap,
    required this.image,
    super.key,
  });

  final int index;
  final VoidCallback onTap;
  final List<String> image;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Image
          Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(image[index].imageProductFormate()),
              ),
            ),
          ),
          //Icon Button
          Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
