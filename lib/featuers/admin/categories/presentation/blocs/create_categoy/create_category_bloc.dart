import 'dart:async';
import 'package:flutter/material.dart';
import '../../../data/models/create_category/create_catecory_model_request.dart';
import '../../../domain/use_cases/create_category/create_category_use_case.dart';
import 'create_category_event.dart';
import 'create_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  CreateCategoryBloc(this._categoryUseCase)
      : super(const CreateCategoryIntialState()) {
    on<CreateCategoryEvent>(createCategory);
  }
  final CreateCategoryUseCase _categoryUseCase;
   String? image = "https://tse1.mm.bing.net/th?id=OIP.lImHFzwJU9tKfclX3EEazQHaHa&pid=Api&P=0&h=220";
  final GlobalKey key = GlobalKey();
  TextEditingController nameController = TextEditingController();
  FutureOr<void> createCategory(event, emit) async {
    emit(state.copyWith(states: CreateCategoryStateValue.loading));
    var result = await _categoryUseCase.call(CreateCatecoryModelRequest(
        image: image ?? "", name: nameController.text));
    result.when(
      success: (data) {
        emit(state.copyWith(states: CreateCategoryStateValue.success));
      },
      failure: (errorHandler) {
        emit(state.copyWith(
            states: CreateCategoryStateValue.error,
            errorMessage: errorHandler));
      },
    );
  }
}
