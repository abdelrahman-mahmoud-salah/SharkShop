import 'package:flutter/material.dart';
import '../../../../../../core/common/toast/show_toast.dart';
import '../../../../../../core/extension/context_extention.dart';
import '../../blocs/delete_category/delete_category_bloc.dart';
import '../../blocs/delete_category/delete_category_event.dart';
import '../../blocs/delete_category/delete_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteCategoryIcon extends StatelessWidget {
  const DeleteCategoryIcon({
    super.key,
    required this.Id,
  });
  final String Id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteCategoryBloc, DeleteCategoryState>(
      builder: (context, state) {
        if (state.state == DeleteCategoryValueState.loading) {
         
          return Container(
            color: Colors.red,
            child: Center(
                child: CircularProgressIndicator(
              color: context.mycolors.bluePinkDark,
            )),
          );
        } else {
          debugPrint("id selction is : $Id");
          return SlidableAction(
            onPressed: (context) {
              context.read<DeleteCategoryBloc>().id = Id;
              context
                  .read<DeleteCategoryBloc>()
                  .add(DeleteCategoryEvent.deleteCategory(Id: Id));
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
