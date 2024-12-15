import 'dart:async';
import 'package:flutter/widgets.dart';
import '../../../data/models/create_category/create_catecory_model_request.dart';
import '../../../domain/use_cases/update_category/update_category_use_case.dart';
import 'update_category_event.dart';
import 'update_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCategoryBloc
    extends Bloc<UpdateCategoryEvent, UpdateCategoryState> {
  UpdateCategoryBloc(this._updateCategoryUseCase)
      : super(const UpdateCategoryInitialState()) {
    on<UpdateCategoryEvent>(updateCategory);
  }
  final UpdateCategoryUseCase _updateCategoryUseCase;
  final TextEditingController nameController = TextEditingController();
   String image = "";
  final GlobalKey key = GlobalKey();
  int id=0;
  FutureOr<void> updateCategory(event, emit) async {
    emit(const UpdateCategoryState().copyWith(
        stateValue: UpdateCategoryStateValue.loading,
        loading: event.toString()));
    var card = await _updateCategoryUseCase.call(
        id:id ,
        model: CreateCatecoryModelRequest(
            image: image, name: nameController.text));
    card.when(
      success: (data) {
        emit(const UpdateCategoryState().copyWith(
          stateValue: UpdateCategoryStateValue.success,
        ));
      },
      failure: (errorHandler) {
        emit(const UpdateCategoryState().copyWith(
            stateValue: UpdateCategoryStateValue.error,
            errorMessage: errorHandler));
      },
    );
  }
}
