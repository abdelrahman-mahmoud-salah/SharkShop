import 'dart:async';
import 'package:flutter_application_2/featuers/admin/categories/domain/use_cases/get_all_category/get_all_category_use_case.dart';
import 'getallcategory_incustomer_event.dart';
import 'getallcategory_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetallcategoryInCustomerBloc
    extends Bloc<GetallcategoryInCustomerEvent, GetallcategoryInCustomerState> {
  GetallcategoryInCustomerBloc(this._allCategoryUseCase)
      : super(const IntialGetallCategories()) {
    on<GetAllCategoryInCustomerSuccessEvent>(getAllCategory);
  }
  final GetAllCategoryUseCase _allCategoryUseCase;

  FutureOr<void> getAllCategory(
      GetAllCategoryInCustomerSuccessEvent event, emit) async {
    emit(const GetallcategoryInCustomerState()
        .copywith(state: GetallcategoryStateValue.loading));

    var result = await _allCategoryUseCase.Call();
    result.when(
      success: (data) {
        if (data.isEmpty) {
          emit(const GetallcategoryInCustomerState()
              .copywith(state: GetallcategoryStateValue.empty));
        } else {
          emit(const GetallcategoryInCustomerState().copywith(
              state: GetallcategoryStateValue.success,
              categories: data.reversed.toList()));
        }
      },
      failure: (errorHandler) {
        emit(const GetallcategoryInCustomerState().copywith(
            state: GetallcategoryStateValue.error, error: errorHandler));
      },
    );
  }
}
