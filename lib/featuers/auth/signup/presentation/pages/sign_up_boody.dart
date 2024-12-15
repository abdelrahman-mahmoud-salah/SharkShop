import 'package:flutter/material.dart';
import '../../../../../core/common/widget/text_app.dart';
import '../../../../../core/extension/context_extention.dart';
import '../../../../../core/routes/routes_app_const.dart';
import '../../../login/presentation/widgets/dark_and_localization_bar.dart';
import '../widgets/sigin_up_formfield.dart';
import '../widgets/sign_up_title.dart';
import '../widgets/signup_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpBoody extends StatelessWidget {
  const SignUpBoody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DarkAndLocalizationBar(),
        SizedBox(
          height: 20.h,
        ),
        const SignUpTitle(),
        SizedBox(
          height: 20.h,
        ),
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            'https://tse4.mm.bing.net/th?id=OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH&pid=Api&P=0&h=220',
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const SiginUpFormfield(),
        SizedBox(
          height: 20.h,
        ),
        const SignupButton(),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            context.pushReplacedNamed(pageName: RoutesAppConst.logIn);
          },
          child: TextApp(
              textAlign: TextAlign.center,
              text: context.lang.you_have_account,
              theme: context.textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.mycolors.textcolor,
                  fontSize: 17.sp)),
        )
      ],
    );
  }
}
