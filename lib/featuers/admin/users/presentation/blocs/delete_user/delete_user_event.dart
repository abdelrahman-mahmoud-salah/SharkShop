import 'package:equatable/equatable.dart';

class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable

// ignore: must_be_immutable
class DeleteUserEvent extends UserEvent {
  String userId;
  DeleteUserEvent({required this.userId});
  @override
  List<Object?> get props => [userId];
}
