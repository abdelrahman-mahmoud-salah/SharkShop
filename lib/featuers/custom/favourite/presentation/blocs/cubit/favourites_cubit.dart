import 'package:flutter_application_2/core/common/loacalDataBase/hive/hive_database.dart';
import 'package:flutter_application_2/featuers/custom/favourite/data/models/favourite_model.dart';
import 'package:flutter_application_2/featuers/custom/favourite/presentation/blocs/cubit/favourites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesState());
  Future<void> managementFavourites({
    String? productId,
    String? categoryName,
    String? image,
    String? price,
    String? title,
    String? description,
  }) async {
    final index = HiveDatabase().favoritesBox!.values.toList().indexWhere(
          (e) => e.id == productId,
        );
    if (index >= 0) {
      HiveDatabase().favoritesBox!.deleteAt(index);
    
    } else {
      HiveDatabase().favoritesBox!.add(
            FavoritesModel(
              categoryName: categoryName!,
              id: productId!,
              image: image!,
              price: price!,
              title: title!,
              description: description!,
            ),
          );
    }
    emit(FavouritesState().copyWith(
        state: FavouritesStateEnum.addAndRemoveFavourite,
        favourites: HiveDatabase().favoritesBox!.values.toList()));
  }

  bool isFavorites(String productId) {
    return HiveDatabase()
        .favoritesBox!
        .values
        .toList()
        .any((e) => e.id == productId);
  }
   List<FavoritesModel> get favoritesLis {
    return HiveDatabase().favoritesBox!.values.toList();
  }
}
