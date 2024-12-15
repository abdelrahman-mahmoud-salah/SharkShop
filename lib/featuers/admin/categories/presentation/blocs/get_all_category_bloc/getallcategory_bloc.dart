import 'dart:async';
import '../../../domain/use_cases/get_all_category/get_all_category_use_case.dart';
import 'getallcategory_event.dart';
import 'getallcategory_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetallcategoryBloc
    extends Bloc<GetallcategoryEvent, GetallcategoryState> {
  GetallcategoryBloc(this._allCategoryUseCase)
      : super(const IntialGetallCategories()) {
    on<GetallcategoryEvent>(getAllCategory);
  }
  final GetAllCategoryUseCase _allCategoryUseCase;

  FutureOr<void> getAllCategory(event, emit) async {
    if (event.toString() == "true") {
      emit(const GetallcategoryState()
          .copywith(state: GetallcategoryStateValue.loading));
    }
    var result = await _allCategoryUseCase.Call();
    result.when(
      success: (data) {
        if (data.isEmpty) {
          emit(const GetallcategoryState()
              .copywith(state: GetallcategoryStateValue.empty));
        } else {
          emit(const GetallcategoryState().copywith(
              state: GetallcategoryStateValue.success,
              categories: data.reversed.toList()));
        }
      },
      failure: (errorHandler) {
        emit(const GetallcategoryState().copywith(
            state: GetallcategoryStateValue.error, error: errorHandler));
      },
    );
  }
}
