import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/toast/show_toast.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/delete_product/delete_product_bloc.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/delete_product/delete_product_event.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/delete_product/delete_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteProductIcon extends StatelessWidget {
  const DeleteProductIcon({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteProductBloc, DeleteProductState>(
      listener: (context, state) {
        if (state.stateValues == DeleteProductStateValues.success) {
          return ShowToast.showToastSuccessTop(
              message: context.lang.is_delete, seconds: 40);
        } else if (state.stateValues == DeleteProductStateValues.error) {
          return ShowToast.showToastErrorTop(
              message: context.lang.not_delete, seconds: 40);
        }
      },
      builder: (context, state) {
        if (state.stateValues == DeleteProductStateValues.loading) {
          if (state.productId == id) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return IconButton(
                onPressed: () {
                  context.read<DeleteProductBloc>().add(DeleteProduct(id: id));
                },
                icon: const Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                ));
          }
        } else if (state.stateValues == DeleteProductStateValues.success) {
          return IconButton(
              onPressed: () {
                context.read<DeleteProductBloc>().add(DeleteProduct(id: id));
              },
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ));
        } else {
          return IconButton(
              onPressed: () {
                context.read<DeleteProductBloc>().add(DeleteProduct(id: id));
              },
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ));
        }
      },
    );
  }
}
