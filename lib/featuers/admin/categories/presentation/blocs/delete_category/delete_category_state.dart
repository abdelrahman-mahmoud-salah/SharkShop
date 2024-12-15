import 'package:equatable/equatable.dart';

enum DeleteCategoryValueState { initial, loading, success, error }

class DeleteCategoryState extends Equatable {
  final DeleteCategoryValueState? state;
  final String? error;
  final String? loading;

  const DeleteCategoryState({
    this.state,
    this.error,
    this.loading,
  });

  DeleteCategoryState copyWith({
    final DeleteCategoryValueState? state,
    final String? error,
    final String? loading,
  }) =>
      DeleteCategoryState(
        state: state ?? this.state,
        error: error ?? this.error,
        loading: loading ?? this.loading,
      );
  @override
  List<Object?> get props => [state,error,loading];
}

class DeleteCategoryIntialState extends DeleteCategoryState {
  const DeleteCategoryIntialState()
      : super(state: DeleteCategoryValueState.initial);
}
