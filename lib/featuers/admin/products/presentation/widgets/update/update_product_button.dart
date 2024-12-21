import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/custom_button.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/update_product/update_product_bloc.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/update_product/update_product_event.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/update_product/update_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProductButton extends StatelessWidget {
  const UpdateProductButton({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductBloc, UpdateProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status == UpdateProductStateValues.loading) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50.h,
            child: const Center(child: CircularProgressIndicator()),
          );
        } else {
          return CustomButton(
            onPressed: () {
              print("update product");
              print("id in view: $id");
              _validUpdateProduct(context);
            },
            backgroundColor: context.mycolors.textColorInButton,
            lastRadius: 20,
            threeRadius: 20,
            textColor: context.mycolors.bluePinkDark,
            text: 'update Product',
            width: MediaQuery.of(context).size.width,
            height: 50.h,
          );
        }
      },
    );
  }

  void _validUpdateProduct(BuildContext context) {
    if (context.read<UpdateProductBloc>().fromKey.currentState!.validate()) {
      //update category
      context.read<UpdateProductBloc>().add(UpdateProductAdmin(id.toString()));
    }
  }
}
