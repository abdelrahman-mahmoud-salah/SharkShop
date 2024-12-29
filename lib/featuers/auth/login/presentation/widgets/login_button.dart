import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/routes/routes_app_const.dart';
import '../../../../../core/common/widget/custom_linear_bottom.dart';
import '../../../../../core/common/widget/text_app.dart';
import '../../../../../core/extension/context_extention.dart';
import '../../../../../core/toast/show_toast.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.screenStatus == LoginStateValue.error) {
          return ShowToast.showToastErrorTop(message: state.failures!);
        } else if (state.screenStatus == LoginStateValue.success) {
          context.pushNamed(pageName: RoutesAppConst.mainScreenUser);
          return ShowToast.showToastSuccessTop(
              message: context.lang.logged_successfully);
        }
      },
      builder: (context, state) {
        if (state.screenStatus == LoginStateValue.Loading) {
          return CustomLinearButton(
            onPressed: () {},
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          return CustomLinearButton(
            onPressed: () {
              _validateThenDoLogin(context);
            },
            width: MediaQuery.of(context).size.width,
            height: 50.h,
            child: TextApp(
                textAlign: TextAlign.center,
                text: context.lang.login,
                theme: context.textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: context.mycolors.textColorInButton)),
          );
        }
      },
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (context.read<LoginBloc>().formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(SignInEvent());
    }
  }
}
