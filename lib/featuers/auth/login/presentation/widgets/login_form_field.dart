import 'package:flutter/material.dart';
import '../../../../../core/common/widget/text_from_field_app.dart';
import '../../../../../core/extension/context_extention.dart';
import '../../../../../core/utils/app_regex.dart';
import '../bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginBloc>().formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: context.read<LoginBloc>().emailController,
              hintText: context.lang.your_email,
              keyboardType: TextInputType.emailAddress,
              validator: (p0) {
                if (!AppRegex.isEmailValid(p0!) || p0.isEmpty) {
                  return context.lang.valid_email;
                }
                return null;
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              controller: context.read<LoginBloc>().passwordController,
              hintText: context.lang.password,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.visibility_sharp,
                      color: context.mycolors.textcolor,
                    ),
                  )),
              validator: (p0) {
                if (p0!.isEmpty) {
                  return context.lang.valid_passwrod;
                }
                return null;
              },
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ));
  }
}
