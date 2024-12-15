import 'dart:async';

import 'product_number_event.dart';
import 'product_number_state.dart';
import '../../../../products/domain/use_cases/product_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductNumberBloc extends Bloc<ProductsNumberEvent, ProductNumberState> {
  ProductNumberBloc(this.productUsecase) : super(const InitialProductNumber()) {
    on<ProductsNumberEvent>(getAllProduct);
  }
GetAllProductUsecase productUsecase;
  FutureOr<void> getAllProduct(event, emit) async {
    emit(const ProductNumberState().copyWith(status: ProductStatus.Loading));

    
    final result = await productUsecase.Call();
    result.when(
      success: (data) {
        emit(ProductNumberState(
            numberOfProducts: data.length, status: ProductStatus.Success));
      },
      failure: (errorHandler) {
        print(errorHandler);
        emit(ProductNumberState(
            status: ProductStatus.Error, errorMessage: errorHandler));
      },
    );
  }

  
}
