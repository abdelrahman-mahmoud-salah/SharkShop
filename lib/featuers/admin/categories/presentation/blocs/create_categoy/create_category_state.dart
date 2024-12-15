import 'package:equatable/equatable.dart';

enum CreateCategoryStateValue {
  // ignore: constant_identifier_names
  initial,
  loading,
  success,
  error
}

class CreateCategoryState extends Equatable {
  final CreateCategoryStateValue? states;
  final String? errorMessage;

  const CreateCategoryState({this.states, this.errorMessage});
  CreateCategoryState copyWith({
    final CreateCategoryStateValue? states,
    final String? errorMessage,
  }) =>
      CreateCategoryState(
          errorMessage: errorMessage ?? this.errorMessage,
          states: states ?? this.states);

  @override
  List<Object?> get props => [
        states,
        errorMessage,
      ];
}

class CreateCategoryIntialState extends CreateCategoryState {
  const CreateCategoryIntialState()
      : super(states: CreateCategoryStateValue.initial);
}
