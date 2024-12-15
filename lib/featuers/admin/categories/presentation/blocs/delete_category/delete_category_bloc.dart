import 'dart:async';
import 'package:flutter_application_2/featuers/admin/categories/domain/use_cases/dalete_category/delete_category_use_case.dart';
import 'package:flutter_application_2/featuers/admin/categories/presentation/blocs/delete_category/delete_category_event.dart';
import 'package:flutter_application_2/featuers/admin/categories/presentation/blocs/delete_category/delete_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteCategoryBloc
    extends Bloc<DeleteCategoryEvent, DeleteCategoryState> {
  DeleteCategoryBloc(this._deleteCategoryUseCase)
      : super(const DeleteCategoryIntialState()) {
    on<DeleteCategoryEvent>(deleteCategory);
  }
  final DeleteCategoryUseCase _deleteCategoryUseCase;
  String id = '';
  FutureOr<void> deleteCategory(event, emit) async {
    print(event.toString());
    
    emit(const DeleteCategoryState()
        .copyWith(state: DeleteCategoryValueState.loading, loading: id));

    var result = await _deleteCategoryUseCase.call(id);
    result.when(
      success: (data) {
        emit(const DeleteCategoryState()
            .copyWith(state: DeleteCategoryValueState.success));
      },
      failure: (errorHandler) {
        emit(const DeleteCategoryState().copyWith(
            state: DeleteCategoryValueState.success, error: errorHandler));
      },
    );
  }
}
