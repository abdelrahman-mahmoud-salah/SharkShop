


import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_number_event.freezed.dart';
@freezed
class ProductsNumberEvent with _$ProductsNumberEvent {
  const factory ProductsNumberEvent.started() = _Started;
  const factory ProductsNumberEvent.getProductsNumber() =
      GetProductsNumberEvent;
  

}