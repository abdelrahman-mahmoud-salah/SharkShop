import 'package:equatable/equatable.dart';

class DeleteProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteProduct extends DeleteProductEvent {
final  String id;
  DeleteProduct({required this.id});
  @override
  List<Object?> get props => [id];
}
