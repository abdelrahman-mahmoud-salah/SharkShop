
import 'package:hive_flutter/hive_flutter.dart';
part 'favourite_model.g.dart';
@HiveType(typeId: 0)
class FavoritesModel extends HiveObject {
  FavoritesModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.categoryName,
    required this.description,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String price;

  @HiveField(4)
  final String categoryName;
  @HiveField(5)
  final String description;
}
