import 'package:equatable/equatable.dart';

class AllUserEvent extends Equatable {
  const AllUserEvent();
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class GetAllUserEvent extends AllUserEvent {
  bool loading;
  GetAllUserEvent({required this.loading});
  @override
  List<Object?> get props => [loading];
}
// ignore: must_be_immutable
class SearchUserEvent extends AllUserEvent {
 final String? userName;
 const SearchUserEvent({ this.userName});
  @override
  List<Object?> get props => [userName];
}

