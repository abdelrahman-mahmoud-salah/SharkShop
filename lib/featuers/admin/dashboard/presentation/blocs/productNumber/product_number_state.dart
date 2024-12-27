import 'package:equatable/equatable.dart';

enum ProductStatus {
  // ignore: constant_identifier_names
  Initial,
  // ignore: constant_identifier_names
  Loading,
  // ignore: constant_identifier_names
  Success,
  // ignore: constant_identifier_names
  Error,
}

class ProductNumberState extends Equatable {
  const ProductNumberState(
      {this.status, this.numberOfProducts, this.errorMessage});
  final ProductStatus? status;
  final int? numberOfProducts;
  final String? errorMessage;
  ProductNumberState copyWith({
    ProductStatus? status,
    int? numberOfProducts,
    String? errorMessage,
  }) =>
      ProductNumberState(
        numberOfProducts: numberOfProducts ?? this.numberOfProducts,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [status, errorMessage, numberOfProducts];
}

class InitialProductNumber extends ProductNumberState {
  const InitialProductNumber() : super(status: ProductStatus.Initial);
}
