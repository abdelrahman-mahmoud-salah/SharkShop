import 'package:flutter/material.dart';

import '../../extension/context_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet {
  CustomBottomSheet._();
  // ignore: non_constant_identifier_names
  static void CustomBottomSheetContainer({
    required BuildContext context,
    required Widget w,
    Color? backgroundColor,
    VoidCallback? whenComplete,
  }) =>
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        context: context,
        backgroundColor: backgroundColor ?? context.mycolors.bluePinkDark,
        isScrollControlled: true,
        barrierColor: Colors.transparent,
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: EdgeInsets.all(16.r),
                child: w,
              ),
            ),
          );
        },
      ).whenComplete(whenComplete ?? () {});
}
