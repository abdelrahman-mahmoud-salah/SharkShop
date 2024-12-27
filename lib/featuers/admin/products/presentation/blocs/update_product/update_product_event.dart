import 'package:equatable/equatable.dart';

class UpdateProductEvent extends Equatable {
  const UpdateProductEvent();
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class UpdateProductAdmin extends UpdateProductEvent {
  String id;
  UpdateProductAdmin(this.id);
  @override
  List<Object?> get props => [id];
}
