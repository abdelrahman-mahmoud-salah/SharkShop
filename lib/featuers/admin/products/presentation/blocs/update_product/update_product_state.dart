import 'package:equatable/equatable.dart';

enum UpdateProductStateValues { initial, loading, success, error, empty }

class UpdateProductState extends Equatable {
  const UpdateProductState({
    this.status = UpdateProductStateValues.initial,
    this.errorMessage,
    this.id
  });
  final UpdateProductStateValues? status;

  final String? errorMessage;
  final String? id;
  UpdateProductState copyWith({
    UpdateProductStateValues? status,
    String? errorMessage,
    String? id
  }) =>
      UpdateProductState(
          errorMessage: errorMessage ?? this.errorMessage,
          status: status ?? this.status
          , id: id ?? this.id
          );

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        errorMessage,
        id
      ];
}
