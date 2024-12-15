import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import '../../../../../../core/app/upload_image/cubit/upload_image_cubit.dart';
import '../../../../../../core/common/toast/show_toast.dart';
import '../../blocs/update_category/update_category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class UpdateImageCategory extends StatelessWidget {
  const UpdateImageCategory({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            return ShowToast.showToastSuccessTop(
                message: context.lang.image_uploaded);
          },
          error: (value) {
            ShowToast.showToastErrorTop(message: context.lang.error);
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        return state.maybeWhen(
          loading: () {
            return Container(
              height: 120.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          },
          orElse: () {
            if (cubit.getImageUrl.isNotEmpty) {
              context.read<UpdateCategoryBloc>().image = cubit.getImageUrl;
              return Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(cubit.getImageUrl),
                    // fit: BoxFit.fill,
                  ),
                ),
              );
            } else {
              context.read<UpdateCategoryBloc>().image = image;
              return InkWell(
                onTap: () {
                  context.read<UploadImageCubit>().uploadImage();
                },
                child: Container(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      // fit: BoxFit.fill,
                    ),
                  ),
                  child: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
