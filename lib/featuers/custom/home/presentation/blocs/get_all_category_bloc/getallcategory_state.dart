import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/featuers/admin/categories/data/models/get_all_category/get_all_category_repo_model.dart';


enum GetallcategoryStateValue {
  // ignore: constant_identifier_names
  initial,
  loading,
  success,
  empty,
  error
}

class GetallcategoryInCustomerState extends Equatable {
  final GetallcategoryStateValue? state;
  final String? error;
  final List<GetAllCategoryRepoModel>? categories;

  const GetallcategoryInCustomerState({
    this.state,
    this.error,
    this.categories,
  
  });

  GetallcategoryInCustomerState copywith({
    final GetallcategoryStateValue? state,
    final String? error,
    final List<GetAllCategoryRepoModel>? categories,
  
  }) =>
      GetallcategoryInCustomerState(
    
          state: state ?? this.state,
          error: error ?? this.error,
          categories: categories ?? this.categories);
  @override
  List<Object?> get props => [state, error, categories];
}

class IntialGetallCategories extends GetallcategoryInCustomerState {
 const  IntialGetallCategories()
      : super(state: GetallcategoryStateValue.initial);
}
