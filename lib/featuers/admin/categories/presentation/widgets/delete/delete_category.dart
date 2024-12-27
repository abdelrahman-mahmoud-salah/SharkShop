import 'package:flutter/material.dart';
import '../../../../../../core/extension/context_extention.dart';
import '../../blocs/delete_category/delete_category_bloc.dart';
import '../../blocs/delete_category/delete_category_event.dart';
import '../../blocs/delete_category/delete_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteCategoryIcon extends StatelessWidget {
  const DeleteCategoryIcon({
    super.key,
    // ignore: non_constant_identifier_names
    required this.Id,
  });
  // ignore: non_constant_identifier_names
  final String Id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteCategoryBloc, DeleteCategoryState>(
      builder: (context, state) {
        if (state.state == DeleteCategoryValueState.loading) {
          if (state.loading == Id) {
            return Container(
              color: Colors.red,
              child: Center(
                  child: CircularProgressIndicator(
                color: context.mycolors.bluePinkDark,
              )),
            );
          } else {
            return SlidableAction(
              onPressed: (context) {
                context.read<DeleteCategoryBloc>().id = Id;
                context
                    .read<DeleteCategoryBloc>()
                    .add(DeleteCategoryWithId(Id));
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: context.lang.delete,
            );
          }
        } else {
          debugPrint("id selction is : $Id");
          return SlidableAction(
            onPressed: (context) {
              context.read<DeleteCategoryBloc>().id = Id;
              context.read<DeleteCategoryBloc>().add(DeleteCategoryWithId(Id));
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: context.lang.delete,
          );
        }
      },
    );
  }
}
