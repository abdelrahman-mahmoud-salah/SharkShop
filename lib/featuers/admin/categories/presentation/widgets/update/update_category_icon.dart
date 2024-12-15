import 'package:flutter/material.dart';
import '../../../../../../core/app/upload_image/cubit/upload_image_cubit.dart';
import '../../../../../../core/common/bottomsheet/custom_bottom_sheet.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/extension/context_extention.dart';
import '../../blocs/update_category/update_category_bloc.dart';
import 'update_category_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateCategoryIcon extends StatelessWidget {
  const UpdateCategoryIcon({super.key, required this.id, required this.image});
  final String id;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {
        CustomBottomSheet.CustomBottomSheetContainer(
          context: context,
          w: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<UpdateCategoryBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<UploadImageCubit>(),
              ),
            ],
            child: UpdateCategoryView(
              id: id,
              image: image,
            ),
          ),
          whenComplete: () {},
        );
      },
      backgroundColor: context.mycolors.bluePinkLight!,
      foregroundColor: context.mycolors.textColorInButton,
      icon: Icons.edit,
      label: context.lang.edit,
    );
  }
}
