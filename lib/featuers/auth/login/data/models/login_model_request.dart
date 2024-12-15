import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model_request.g.dart';
@JsonSerializable()
class LoginRequestModel extends Equatable {
  
 
 const LoginRequestModel({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
  @override
  List<Object> get props => [email, password];
}
