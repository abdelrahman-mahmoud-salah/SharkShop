import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/toast/show_toast.dart';
import 'package:flutter_application_2/core/common/widget/custom_button.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/get_all_product/get_all_product_event.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/get_all_product/get_all_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customCreateProductButton extends StatelessWidget {
  const customCreateProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllProductBloc, AllProductState>(
        listener: (context, state) {
      if (state.status == AllProductStateValues.success) {
        return ShowToast.showToastSuccessTop(message: context.lang.is_created);
      }
      if (state.status == AllProductStateValues.error) {
        return ShowToast.showToastErrorTop(message: context.lang.not_created);
      }
    }, builder: (context, state) {
      if (state.status == AllProductStateValues.loading) {
        return CustomButton(
          onPressed: () {},
          backgroundColor: context.mycolors.textColorInButton,
          lastRadius: 20,
          threeRadius: 20,
          isLoading: true,
          textColor: context.mycolors.bluePinkDark,
          text: 'Create Product',
          width: MediaQuery.of(context).size.width,
          height: 50.h,
        );
      }
      return CustomButton(
        onPressed: () {
          context.read<AllProductBloc>().add(CreateProduct());
        },
        backgroundColor: context.mycolors.textColorInButton,
        lastRadius: 20,
        threeRadius: 20,
        textColor: context.mycolors.bluePinkDark,
        text: 'Create Product',
        width: MediaQuery.of(context).size.width,
        height: 50.h,
      );
    });
  }
}
