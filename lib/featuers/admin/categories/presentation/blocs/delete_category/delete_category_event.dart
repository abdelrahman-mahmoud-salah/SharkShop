import 'package:equatable/equatable.dart';

class DeleteCategoryEvent extends Equatable {
  const DeleteCategoryEvent();
  @override
  List<Object?> get props => [];
}

class DeleteCategoryWithId extends DeleteCategoryEvent {
  final String Id;
  const DeleteCategoryWithId(this.Id);
   @override
  List<Object?> get props => [Id];
}
