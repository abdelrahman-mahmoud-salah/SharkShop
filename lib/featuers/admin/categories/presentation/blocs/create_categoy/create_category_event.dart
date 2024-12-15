import 'package:freezed_annotation/freezed_annotation.dart';

part  'create_category_event.freezed.dart';

@freezed
class CreateCategoryEvent with _$CreateCategoryEvent {
  const factory CreateCategoryEvent.started() = _Started;
  const factory CreateCategoryEvent.createCategory() = CreateCategory;
}