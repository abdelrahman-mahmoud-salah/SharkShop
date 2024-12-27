import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/update/update_product_request_model.dart';
import 'package:flutter_application_2/featuers/admin/products/domain/use_cases/update/update_product_use_case.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/update_product/update_product_event.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/update_product/update_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  UpdateProductBloc(this._updateProductUseCase)
      : super(const UpdateProductState()) {
    on<UpdateProductAdmin>(updateProduct);
  }
  final UpdateProductUseCase _updateProductUseCase;
  final fromKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> lisImages = [];

  FutureOr<void> updateProduct(UpdateProductAdmin event, emit) async {
    emit(const UpdateProductState()
        .copyWith(status: UpdateProductStateValues.loading));

    var product = await _updateProductUseCase.call(
        event.id,
        UpdateProductRequestModel(
            title: titleController.text,
            price: int.parse(priceController.text),
            description: descriptionController.text,
            images: lisImages));
    product.when(
      success: (data) {
        emit(const UpdateProductState()
            .copyWith(status: UpdateProductStateValues.success));
      },
      failure: (errorHandler) {
        emit(const UpdateProductState()
            .copyWith(status: UpdateProductStateValues.error));
      },
    );
  }
}
