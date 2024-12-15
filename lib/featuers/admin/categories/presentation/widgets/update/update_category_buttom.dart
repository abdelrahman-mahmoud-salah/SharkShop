import 'package:flutter/material.dart';
import '../../../../../../core/common/toast/show_toast.dart';
import '../../../../../../core/common/widget/custom_button.dart';
import '../../../../../../core/extension/context_extention.dart';
import '../../blocs/update_category/update_category_bloc.dart';
import '../../blocs/update_category/update_category_event.dart';
import '../../blocs/update_category/update_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateCategoryButtom extends StatelessWidget {
  const CreateCategoryButtom({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCategoryBloc, UpdateCategoryState>(
      listener: (context, state) {
        if (state.stateValue == UpdateCategoryStateValue.success) {
          return ShowToast.showToastSuccessTop(
              message: context.lang.is_updated, seconds: 40);
        } else if (state.stateValue == UpdateCategoryStateValue.error) {
          return ShowToast.showToastErrorTop(
              message: context.lang.not_updated, seconds: 40);
        }
      },
      builder: (context, state) {
        if (state.stateValue == UpdateCategoryStateValue.loading) {
          return Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: context.mycolors.bluePinkDark,
              ),
            ),
          );
        } else {
          return CustomButton(
              onPressed: () {
                print(id);
                context
                    .read<UpdateCategoryBloc>()
                    .add(UpdateCategoryEvent.updateCategory(categoryId: id));
              },
              lastRadius: 10,
              threeRadius: 10,
              text: context.lang.update_category,
              width: MediaQuery.of(context).size.width,
              backgroundColor: context.mycolors.bluePinkLight,
              height: 50.h);
        }
      },
    );
  }
}
