import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_catecory_model_request.g.dart';
@JsonSerializable()
class CreateCatecoryModelRequest {
  final String name;
  final String image;
  CreateCatecoryModelRequest({ required this.name, required this.image});
  
  factory CreateCatecoryModelRequest.fromJson(Map<String, dynamic> json) => _$CreateCatecoryModelRequestFromJson(json);
  
  Map<String, dynamic> toJson() => _$CreateCatecoryModelRequestToJson(this);
}
