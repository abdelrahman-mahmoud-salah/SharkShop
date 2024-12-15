import 'package:equatable/equatable.dart';
import '../../../data/models/product_repo_model.dart';

enum GetAllProductStateValues { 
  initial,
  loading,
  success,
  error,
}

class GetAllProductState extends Equatable {
  const GetAllProductState(
      {this.status, this.errorMessage,this.products});
  final GetAllProductStateValues? status;
  final List< ProductRepoModel>? products;
 
  final String? errorMessage;
  GetAllProductState copyWith({
    GetAllProductStateValues? status,
 List< ProductRepoModel>? productRepoModel,
    String? errorMessage,
  }) =>
      GetAllProductState(
        products: productRepoModel??this.products,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [status, errorMessage,products];
}

class InitialGetAllProductState extends GetAllProductState {
  const InitialGetAllProductState() : super(status:GetAllProductStateValues.initial );
}
