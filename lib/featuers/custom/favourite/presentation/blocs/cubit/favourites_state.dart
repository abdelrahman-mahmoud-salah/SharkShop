import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/featuers/custom/favourite/data/models/favourite_model.dart';

enum FavouritesStateEnum {
  initial,
  addAndRemoveFavourite,
}

// ignore: must_be_immutable
class FavouritesState extends Equatable {
  FavouritesStateEnum? state;
  List<FavoritesModel>? favourites;
FavouritesState({this.state = FavouritesStateEnum.initial, this.favourites});
FavouritesState copyWith({FavouritesStateEnum? state,List<FavoritesModel>? favourites})=>
FavouritesState(state:state??this.state,favourites:favourites??this.favourites);
  @override
  // TODO: implement props
  List<Object?> get props => [state,favourites];
}
