import 'package:equatable/equatable.dart';

class AllProductCustomerEvent extends Equatable {
  const AllProductCustomerEvent();
  @override
  List<Object?> get props => [];
}

class GetAllProductCustomer extends AllProductCustomerEvent {
  final String TypeStatus;
  final int? idCategory;
  const GetAllProductCustomer({this.TypeStatus = "s", this.idCategory=null});
  @override
  List<Object?> get props => [];
}
