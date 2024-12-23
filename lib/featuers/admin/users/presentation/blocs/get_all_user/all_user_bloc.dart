import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/entities/get_all_user_repo_entities.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/use_cases/get_all_user/get_all_user_use_case.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_event.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllUserBloc extends Bloc<AllUserEvent, AllUserState> {
  AllUserBloc({
    required this.getAllUserUseCase,
  }) : super(const AllUserState()) {
    on<GetAllUserEvent>(getALlUser);
    on<SearchUserEvent>(_searchForUser);
  }
  final GetAllUserUseCase getAllUserUseCase;
  List<GetAllUsersRepoModelEntities> usersList = [];
  final TextEditingController searchController = TextEditingController();
  FutureOr<void> getALlUser(GetAllUserEvent event, emit) async {
    if (event.loading == true) {
      emit(state.copyWith(state: AllUserStatevalue.loading));
    }
    var result = await getAllUserUseCase.call();
    result.when(
      success: (data) {
        usersList = data;
        if (usersList.isEmpty) {
          emit(state.copyWith(state: AllUserStatevalue.empty));
        } else {
          emit(state.copyWith(
              state: AllUserStatevalue.success, model: usersList));
        }
      },
      failure: (errorHandler) {
        emit(state.copyWith(state: AllUserStatevalue.error));
      },
    );
  }

  FutureOr<void> _searchForUser(
    SearchUserEvent event,
    Emitter<AllUserState> emit,
  ) async {
    final searchResult = usersList
        .where(
          (e) =>
              e.name.toLowerCase().startsWith(
                    event.userName!.toLowerCase().trim(),
                  ) ||
              e.email
                  .toLowerCase()
                  .startsWith(event.userName!.toLowerCase().trim()),
        )
        .toList();

    if (searchResult.isEmpty) {
      emit(state.copyWith(state: AllUserStatevalue.empty));
    } else {
      emit(state.copyWith(
          state: AllUserStatevalue.success, model: searchResult));
    }
  }
}
