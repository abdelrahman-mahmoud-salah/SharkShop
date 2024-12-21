import 'package:equatable/equatable.dart';

enum DeleteProductStateValues {
  initial,
  loading,
  success,
  error,
}

class DeleteProductState extends Equatable {
  final DeleteProductStateValues? stateValues;
 String? productId;
   DeleteProductState({
    this.stateValues = DeleteProductStateValues.initial,
    this.productId,
  });
  DeleteProductState copyWith({
    final DeleteProductStateValues? stateValues,
    final String? productId,
  }) =>
      DeleteProductState(
        stateValues: stateValues ?? this.stateValues,
        productId: productId ?? this.productId,
      );

  @override
  List<Object?> get props => [];
}
