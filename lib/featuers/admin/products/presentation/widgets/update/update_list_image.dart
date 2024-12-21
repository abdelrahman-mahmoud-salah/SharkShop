import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:flutter_application_2/core/common/toast/show_toast.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/update_product/update_product_bloc.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/update/select_update_product_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateListOfImages extends StatelessWidget {
  const UpdateListOfImages({
    super.key,
    required this.image,
  });

  final List<String> image;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UpdateProductBloc>();
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return BlocConsumer<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ShowToast.showToastSuccessTop(
                  message: context.lang.image_uploaded,
                );
              },
              error: (errorMessage) {
                ShowToast.showToastErrorTop(
                  message: errorMessage,
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loadingList: (indexId) {
                if (index == indexId) {
                  return Container(
                    height: 90.h,
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
                }
                return SeletetUpdateYourProductImage(
                  index: index,
                  onTap: () {
                    context.read<UploadImageCubit>().uploadUpdateImageList(
                          indexId: index,
                          productImageList: image,
                        );
                  },
                  image: image,
                );
              },
              orElse: () {
                return SeletetUpdateYourProductImage(
                  index: index,
                  onTap: () {
                    context.read<UploadImageCubit>().uploadUpdateImageList(
                          indexId: index,
                          productImageList: image,
                        );
                    print("list of image is : ${image.length}");
                    print("list of cubit image is : ${image.length}");
                    bloc.lisImages =
                        context.read<UploadImageCubit>().imageUpdateList.isEmpty?
                            image:context.read<UploadImageCubit>().imageUpdateList;

                  },
                  image: image,
                );
              },
            );
          },
        );
      },
      itemCount: image.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10.h,
        );
      },
    );
  }
}
