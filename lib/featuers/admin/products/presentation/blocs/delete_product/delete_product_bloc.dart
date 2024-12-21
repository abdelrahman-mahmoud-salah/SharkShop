import 'dart:async';
import 'package:flutter_application_2/featuers/admin/products/domain/use_cases/delete/delete_product_use_case.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/delete_product/delete_product_event.dart';
import 'package:flutter_application_2/featuers/admin/products/presentation/blocs/delete_product/delete_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  DeleteProductBloc(this._deleteProductUseCase) : super(DeleteProductState()) {
    on<DeleteProduct>(deleteProduct);
  }
  final DeleteProductUseCase _deleteProductUseCase;
  FutureOr<void> deleteProduct(DeleteProduct event, emit) async {
    
    emit(DeleteProductState().copyWith(
        stateValues: DeleteProductStateValues.loading, productId: event.id));

    var result = await _deleteProductUseCase.call(event.id);
    result.when(
      success: (data) {
        emit(DeleteProductState()
            .copyWith(stateValues: DeleteProductStateValues.success));
      },
      failure: (errorHandler) {
        emit(DeleteProductState()
            .copyWith(stateValues: DeleteProductStateValues.error));
      },
    );
  }
}
