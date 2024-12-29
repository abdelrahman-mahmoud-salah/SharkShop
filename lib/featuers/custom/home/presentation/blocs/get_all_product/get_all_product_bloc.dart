import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/get_all_product/product_repo_model.dart';
import 'package:flutter_application_2/featuers/admin/products/domain/use_cases/product_usecase.dart';
import 'get_all_product_event.dart';
import 'get_all_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductCustomerBloc
    extends Bloc<AllProductCustomerEvent, AllProductCustomerState> {
  AllProductCustomerBloc({
    required this.getAllProductUsecase,
  }) : super(const InitialGetAllProductState()) {
    on<GetAllProductCustomer>(getAllProduct);
  }
  final GetAllProductUsecase getAllProductUsecase;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> lisImages = [];
  int? categoryId;
  List<ProductRepoModel> products = [];
  List<ProductRepoModel> AllView = [];
  List<ProductRepoModel> productOfCategory = [];
  FutureOr<void> getAllProduct(GetAllProductCustomer event, emit) async {
    emit(const AllProductCustomerState()
        .copyWith(status: AllProductCustomerStateValues.loading));

    var result = await getAllProductUsecase.Call();
    result.when(
      success: (data) {
        products = [];
        AllView = [];
        productOfCategory = [];
        products.addAll(data);

        if (data.isEmpty) {
          emit(const AllProductCustomerState()
              .copyWith(status: AllProductCustomerStateValues.empty));
        } else {
          if (event.TypeStatus == "s") {
            if (event.idCategory == null) {
              emit(const AllProductCustomerState().copyWith(
                  productRepoModel: products.take(10).toList(),
                  status: AllProductCustomerStateValues.success));
            } else {
              changeProduct(event.idCategory!, emit);
            }
          } else {
            if (categoryId == null) {
              emit(const AllProductCustomerState()
                  .copyWith(status: AllProductCustomerStateValues.loading));
              emit(const AllProductCustomerState().copyWith(
                  productRepoModel: data,
                  status: AllProductCustomerStateValues.allView));
            } else {
              changeProductAllView(categoryId!, emit);
            }
          }
        }
      },
      failure: (errorHandler) {
        emit(const AllProductCustomerState().copyWith(
            errorMessage: errorHandler,
            status: AllProductCustomerStateValues.error));
      },
    );
  }

  void changeProduct(int id, emit) {
    products.map(
      (e) {
        if (id == e.category!.id) {
          productOfCategory.add(e);
        }
      },
    ).toList();
    if (productOfCategory.isEmpty) {
      emit(const AllProductCustomerState()
          .copyWith(status: AllProductCustomerStateValues.empty));
    } else {
      emit(const AllProductCustomerState().copyWith(
          productRepoModel: productOfCategory.take(6).toList(),
          status: AllProductCustomerStateValues.success));
    }
  }

  void changeProductAllView(int id, emit) {
    products.map(
      (e) {
        if (id == e.category!.id) {
          AllView.add(e);
        }
      },
    ).toList();
    if (AllView.isEmpty) {
      emit(const AllProductCustomerState()
          .copyWith(status: AllProductCustomerStateValues.empty));
    } else {
      emit(const AllProductCustomerState().copyWith(
          productRepoModel: AllView,
          status: AllProductCustomerStateValues.allView));
    }
  }
}
