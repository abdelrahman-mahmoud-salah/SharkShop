import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_category_event.freezed.dart';

@freezed
class UpdateCategoryEvent with _$UpdateCategoryEvent {
  const factory UpdateCategoryEvent.started() = _Started;
  const factory UpdateCategoryEvent.updateCategory({required String categoryId}) = UpdateCategory;
}