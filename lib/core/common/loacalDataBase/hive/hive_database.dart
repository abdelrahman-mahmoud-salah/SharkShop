import 'package:flutter_application_2/featuers/custom/favourite/data/models/favourite_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  factory HiveDatabase() => _instance;

  HiveDatabase._();
  static final HiveDatabase _instance = HiveDatabase._();

  Box<FavoritesModel>? favoritesBox;
  Future<void> setup() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FavoritesModelAdapter());
    favoritesBox = await Hive.openBox<FavoritesModel>("favorites");
  }

  Future<void> clearAllBox() async {
    await favoritesBox!.clear();
  }
}
