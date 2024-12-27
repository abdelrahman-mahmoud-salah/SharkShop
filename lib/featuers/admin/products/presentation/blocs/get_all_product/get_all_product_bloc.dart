import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/create_product/create_product_request_model.dart';
import 'package:flutter_application_2/featuers/admin/products/domain/use_cases/create_product/create_product_use_case.dart';

import '../../../domain/use_cases/product_usecase.dart';
import 'get_all_product_event.dart';
import 'get_all_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  AllProductBloc(
      {required this.getAllProductUsecase, required this.createProductUseCase})
      : super(const InitialGetAllProductState()) {
    on<GetAllProduct>(getAllProduct);
    on<CreateProduct>(createProduct);
  }
  final GetAllProductUsecase getAllProductUsecase;
  final CreateProductUseCase createProductUseCase;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> lisImages = [];
  int categoryId = 0;

  FutureOr<void> getAllProduct(event, emit) async {
    emit(const AllProductState()
        .copyWith(status: AllProductStateValues.loading));

    var result = await getAllProductUsecase.Call();
    result.when(
      success: (data) {
        if (data.isEmpty) {
          emit(const AllProductState().copyWith(
              productRepoModel: data, status: AllProductStateValues.empty));
        } else {
          emit(const AllProductState().copyWith(
              productRepoModel: data, status: AllProductStateValues.success));
        }
      },
      failure: (errorHandler) {
        emit(const AllProductState().copyWith(
            errorMessage: errorHandler, status: AllProductStateValues.error));
      },
    );
  }

  FutureOr<void> createProduct(event, emit) async {
    emit(const AllProductState()
        .copyWith(status: AllProductStateValues.loading));

    var result = await createProductUseCase.call(CreateProductRequestModel(
        categoryId: categoryId,
        description: descriptionController.text,
        price: int.parse(priceController.text),
        images: lisImages,
        title: titleController.text));
    result.when(
      success: (data) {
        emit(const AllProductState()
            .copyWith(status: AllProductStateValues.success));
      },
      failure: (errorHandler) {
        emit(const AllProductState().copyWith(
            errorMessage: errorHandler, status: AllProductStateValues.error));
      },
    );
  }
}
