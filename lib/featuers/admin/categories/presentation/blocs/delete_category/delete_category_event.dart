import 'package:equatable/equatable.dart';

class DeleteCategoryEvent extends Equatable {
  const DeleteCategoryEvent();
  @override
  List<Object?> get props => [];
}

class DeleteCategoryWithId extends DeleteCategoryEvent {
  // ignore: non_constant_identifier_names
  final String Id;
  const DeleteCategoryWithId(this.Id);
   @override
  List<Object?> get props => [Id];
}
