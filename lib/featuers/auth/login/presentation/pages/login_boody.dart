import 'package:flutter/material.dart';
import '../../../../../core/common/widget/text_app.dart';
import '../../../../../core/extension/context_extention.dart';
import '../../../../../core/routes/routes_app_const.dart';
import '../widgets/dark_and_localization_bar.dart';
import '../widgets/login_button.dart';
import '../widgets/login_form_field.dart';
import '../widgets/login_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginBoody extends StatelessWidget {
  const LoginBoody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const DarkAndLocalizationBar(),
          SizedBox(
            height: 50.h,
          ),
          const LoginTitle(),
          SizedBox(
            height: 50.h,
          ),
          const LoginFormField(),
          SizedBox(
            height: 20.h,
          ),
          const LoginButton(),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextApp(
                  maxLines: 2,
                  softWrap: true,
                  text: context.lang.question_have_account,
                  theme: context.textStyle.copyWith(
                      color: context.mycolors.textcolor, fontSize: 15.sp)),
              InkWell(
                onTap: () {
                  context.pushNamed(pageName: RoutesAppConst.signUp);
                },
                splashColor: context.mycolors.containerLinear1,
                child: TextApp(
                    maxLines: 2,
                    softWrap: true,
                    textOverflow: TextOverflow.clip,
                    text: context.lang.sign_up,
                    theme: context.textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.mycolors.bluePinkLight,
                        fontSize: 17.sp)),
              )
            ],
          )
        ],
      ),
    );
  }
}
