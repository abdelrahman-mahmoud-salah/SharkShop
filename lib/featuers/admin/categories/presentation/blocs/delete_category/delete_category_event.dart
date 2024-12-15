import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_category_event.freezed.dart';

@freezed
class DeleteCategoryEvent with _$DeleteCategoryEvent {
  const factory DeleteCategoryEvent.started() = _Started;
  // ignore: non_constant_identifier_names
  const factory DeleteCategoryEvent.deleteCategory({required String Id}) =
      DeleteCategory;
}
