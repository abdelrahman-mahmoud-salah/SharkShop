import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/get_all_product/product_repo_model.dart';


enum AllProductCustomerStateValues { 
  initial,
  loading,
  success,
  allView,
  categoryKind,
  error,
  empty
}

class AllProductCustomerState extends Equatable {
  const AllProductCustomerState(
      {this.status, this.errorMessage,this.products});
  final AllProductCustomerStateValues? status;
  final List< ProductRepoModel>? products;
 
  final String? errorMessage;
  AllProductCustomerState copyWith({
    AllProductCustomerStateValues? status,
 List< ProductRepoModel>? productRepoModel,
    String? errorMessage,
  }) =>
      AllProductCustomerState(
        // ignore: unnecessary_this
        products: productRepoModel?? this.products ,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [status, errorMessage,products];
}

class InitialGetAllProductState extends AllProductCustomerState {
  const InitialGetAllProductState() : super(status:AllProductCustomerStateValues.initial );
}
