import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:flutter_application_2/core/common/toast/show_toast.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/widgets/create_product/selected_product_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOfImageViewAndLogic extends StatelessWidget {
  const ListOfImageViewAndLogic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return BlocConsumer<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
             state.whenOrNull(
              success: () {
                ShowToast.showToastSuccessTop(
                  message: context.lang.image_uploaded
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
            return SeletetYourProductImage(
              index: index,
              onTap: () {},
            );
          },
          orElse: () {
            context.read<AllProductBloc>().lisImages =
                context.read<UploadImageCubit>().imageList;
            return SeletetYourProductImage(
              index: index,
              onTap: () {
                context
                    .read<UploadImageCubit>()
                    .uploadImageList(indexId: index);
              },
            );
          },
        );
          },
        );
       
      },
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10.h,
        );
      },
    );
  }
}
