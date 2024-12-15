import 'package:flutter/material.dart';
import '../../../../../../core/common/toast/show_toast.dart';
import '../../../../../../core/common/widget/custom_button.dart';
import '../../../../../../core/extension/context_extention.dart';
import '../../blocs/create_categoy/create_category_bloc.dart';
import '../../blocs/create_categoy/create_category_event.dart';
import '../../blocs/create_categoy/create_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateCategoryButtom extends StatefulWidget {
  const CreateCategoryButtom({
    super.key,
  });

  @override
  State<CreateCategoryButtom> createState() => _CreateCategoryButtomState();
}

class _CreateCategoryButtomState extends State<CreateCategoryButtom> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
      listener: (context, state) {
        if (state.states == CreateCategoryStateValue.success) {
          return ShowToast.showToastSuccessTop(
              message: context.lang.is_created, seconds: 40);
        } else if (state.states == CreateCategoryStateValue.error) {
          return ShowToast.showToastErrorTop(
              message: context.lang.not_created, seconds: 40);
        }
      },
      builder: (context, state) {
        if (state.states == CreateCategoryStateValue.loading) {
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
                context
                    .read<CreateCategoryBloc>()
                    .add(const CreateCategoryEvent.createCategory());
              },
              lastRadius: 10,
              threeRadius: 10,
              text: "${context.lang.add} ${context.lang.categories}",
              width: MediaQuery.of(context).size.width,
              backgroundColor: context.mycolors.bluePinkLight,
              height: 50.h);
        }
      },
    );
  }
}
