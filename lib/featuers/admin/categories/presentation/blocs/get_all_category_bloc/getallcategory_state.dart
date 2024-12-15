import 'package:equatable/equatable.dart';
import '../../../data/models/get_all_category/get_all_category_repo_model.dart';

enum GetallcategoryStateValue {
  // ignore: constant_identifier_names
  initial,
  loading,
  success,
  empty,
  error
}

class GetallcategoryState extends Equatable {
  final GetallcategoryStateValue? state;
  final String? error;
  final List<GetAllCategoryRepoModel>? categories;

  const GetallcategoryState({
    this.state,
    this.error,
    this.categories,
  
  });

  GetallcategoryState copywith({
    final GetallcategoryStateValue? state,
    final String? error,
    final List<GetAllCategoryRepoModel>? categories,
  
  }) =>
      GetallcategoryState(
    
          state: state ?? this.state,
          error: error ?? this.error,
          categories: categories ?? this.categories);
  @override
  List<Object?> get props => [state, error, categories];
}

class IntialGetallCategories extends GetallcategoryState {
 const  IntialGetallCategories()
      : super(state: GetallcategoryStateValue.initial);
}
