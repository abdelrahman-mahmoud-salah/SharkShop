import 'package:flutter/material.dart';
import '../../../../../core/common/widget/text_from_field_app.dart';
import '../../../../../core/extension/context_extention.dart';
import '../../../../../core/utils/app_regex.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SiginUpFormfield extends StatelessWidget {
  const SiginUpFormfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: GlobalKey(),
        child: Column(
          children: [
            CustomTextField(
              controller: TextEditingController(),
              hintText: context.lang.full_name,
              keyboardType: TextInputType.name,
              validator: (p0) {
                if (p0!.isEmpty || p0.length > 5) {
                  context.lang.valid_name;
                }
                return null;
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hintText: context.lang.your_email,
              keyboardType: TextInputType.emailAddress,
              validator: (p0) {
                if (!AppRegex.isEmailValid(p0!) || p0.isEmpty) {
                  context.lang.valid_email;
                }
                return null;
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              controller: TextEditingController(),
              keyboardType: TextInputType.visiblePassword,
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
                if (!AppRegex.isPasswordValid(p0!) ||
                    p0.isEmpty ||
                    p0.length >= 10) {
                  context.lang.valid_passwrod;
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
