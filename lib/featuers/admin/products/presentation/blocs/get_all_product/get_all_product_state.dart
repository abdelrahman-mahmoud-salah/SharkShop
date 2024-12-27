import 'package:equatable/equatable.dart';
import '../../../data/models/get_all_product/product_repo_model.dart';

enum AllProductStateValues { 
  initial,
  loading,
  success,
  error,
  empty
}

class AllProductState extends Equatable {
  const AllProductState(
      {this.status, this.errorMessage,this.products});
  final AllProductStateValues? status;
  final List< ProductRepoModel>? products;
 
  final String? errorMessage;
  AllProductState copyWith({
    AllProductStateValues? status,
 List< ProductRepoModel>? productRepoModel,
    String? errorMessage,
  }) =>
      AllProductState(
        // ignore: unnecessary_this
        products: productRepoModel?? this.products ,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [status, errorMessage,products];
}

class InitialGetAllProductState extends AllProductState {
  const InitialGetAllProductState() : super(status:AllProductStateValues.initial );
}
