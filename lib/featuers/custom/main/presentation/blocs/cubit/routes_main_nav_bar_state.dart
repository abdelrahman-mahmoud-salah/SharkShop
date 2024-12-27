import 'package:equatable/equatable.dart';

enum RoutesMainNavBarStateValue {
  profile,
  home,
  favourites,
  notifications,
}

class RoutesMainNavBarState extends Equatable {
  final RoutesMainNavBarStateValue? page;
  
  const RoutesMainNavBarState(
      {this.page = RoutesMainNavBarStateValue.home,});

  RoutesMainNavBarState copyWith(
          {final RoutesMainNavBarStateValue? page,}) =>
      RoutesMainNavBarState(page: page ?? this.page, );

  @override
  List<Object?> get props => [page];
}
