import 'package:equatable/equatable.dart';

enum UpdateCategoryStateValue { initial, loading, success, error }

class UpdateCategoryState extends Equatable {
  final UpdateCategoryStateValue? stateValue;
  final String? errorMessage;
  final String? loading;
  const UpdateCategoryState({this.stateValue, this.errorMessage,this.loading});
  UpdateCategoryState copyWith(
          {final UpdateCategoryStateValue? stateValue,
          final String? errorMessage,
          final String? loading}) =>
      UpdateCategoryState(errorMessage: errorMessage, stateValue: stateValue,loading: loading);

  @override
  List<Object?> get props => [stateValue, errorMessage, loading];
}

class UpdateCategoryInitialState extends UpdateCategoryState {
  const UpdateCategoryInitialState()
      : super(stateValue: UpdateCategoryStateValue.initial);
}
