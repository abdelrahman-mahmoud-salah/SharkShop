import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeletetYourProductImage extends StatelessWidget {
  const SeletetYourProductImage({
    required this.index,
    required this.onTap,
    super.key,
  });

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return context.read<UploadImageCubit>().imageList[index].isNotEmpty
        ? Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    context.read<UploadImageCubit>().imageList[index]),
              ),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
              height: 90.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.add_a_photo_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),
          );
  }
}
