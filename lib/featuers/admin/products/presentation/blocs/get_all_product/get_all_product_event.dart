import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_product_event.freezed.dart';

@freezed
class GetAllProductEvent with _$GetAllProductEvent {
  const factory GetAllProductEvent.started() = _Started;
  factory GetAllProductEvent.getAllProducts() = GetAllProductsEvent;
}
