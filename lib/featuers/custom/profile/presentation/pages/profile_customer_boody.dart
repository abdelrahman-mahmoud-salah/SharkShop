import 'package:flutter/material.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/widgets/build_developer.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/widgets/build_version.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/widgets/change_language_customer.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/widgets/changr_theme_mode_customer.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/widgets/logout_widget.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/widgets/user_name_avtar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCutomerBoody extends StatelessWidget {
  const ProfileCutomerBoody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserNameAvatar(),
        SizedBox(
          height: 70.h,
        ),
        const ChangeLanguageCustomer(),
        SizedBox(
          height: 30.h,
        ),
        const ChangeThemeCustomer(),
        SizedBox(
          height: 30.h,
        ),
        const BuildDeveloper(),
        SizedBox(
          height: 30.h,
        ),
        const BuildVersion(),
        SizedBox(
          height: 30.h,
        ),
        const LogOutWidget(),
      ],
    );
  }
}
