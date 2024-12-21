import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extension/string_exetension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CashedImage extends StatelessWidget {
  const CashedImage({
    super.key,
    required this.image,
  });

  final List<String>? image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
            height: 200.h,
            width: 145.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ));
      },
      imageUrl: image![0].imageProductFormate(),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
        size: 70,
      ),
    );
  }
}
