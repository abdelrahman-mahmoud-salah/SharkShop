

import 'package:freezed_annotation/freezed_annotation.dart';
part 'getallcategory_event.freezed.dart';
@freezed
class GetallcategoryEvent with _$GetallcategoryEvent {
  const factory GetallcategoryEvent.started() = _Started;
  const factory GetallcategoryEvent.getAllCategry({required bool isloading}) = GetAllCategry;
}