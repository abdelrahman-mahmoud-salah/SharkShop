import 'dart:async';
import '../../../domain/use_cases/product_usecase.dart';
import 'get_all_product_event.dart';
import 'get_all_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllProductBloc extends Bloc<GetAllProductEvent, GetAllProductState> {
  GetAllProductBloc(this._getAllProductUsecase)
      : super(const InitialGetAllProductState()) {
    on<GetAllProductEvent>(getAllProduct);
  }
  final GetAllProductUsecase _getAllProductUsecase;
  FutureOr<void> getAllProduct(event, emit) async {
    emit(const GetAllProductState()
        .copyWith(status: GetAllProductStateValues.loading));

    var result = await _getAllProductUsecase.Call();
    result.when(
      success: (data) {
        emit(const GetAllProductState().copyWith(
            productRepoModel: data, status: GetAllProductStateValues.success));
      },
      failure: (errorHandler) {
        emit(const GetAllProductState().copyWith(
            errorMessage: errorHandler,
            status: GetAllProductStateValues.error));
      },
    );
  }
}
