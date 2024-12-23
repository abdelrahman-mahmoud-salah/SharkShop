import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/text_from_field_app.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_bloc.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_event.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/get_all_user/all_user_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAboutUser extends StatelessWidget {
  const SearchAboutUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllUserBloc, AllUserState>(builder: (context, state) {
      final bloc = context.read<AllUserBloc>();
      return CustomTextField(
        controller: bloc.searchController,
        keyboardType: TextInputType.emailAddress,
        hintText: 'Search for users',
        onChanged: (value) {
          bloc.add(SearchUserEvent(userName: value));
          return null;
        },
        suffixIcon: IconButton(
          onPressed: () {
            bloc.searchController.clear();
            bloc.add(GetAllUserEvent(loading: true));
          },
          icon: bloc.searchController.text.isEmpty
              ? const SizedBox.shrink()
              : Icon(
                  Icons.clear,
                  color: context.mycolors.textColorInButton,
                ),
        ),
      );
    });
  }
}
