import 'package:flutter/material.dart';
import '../../../../../core/common/widget/cutom_container_admin.dart';
import '../../../../../core/loading/shimmer_loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
        height: 150.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoadingShimmer(
                    height: 20.h,
                    borderRadius: 10,
                    width: 80.w,
                  ),
                  LoadingShimmer(
                    height: 20.h,
                    borderRadius: 10,
                    width: 80.w,
                  )
                ],
              ),
              LoadingShimmer(
                height: 150.h,
                width: 150.w,
                borderRadius: 16,
              )
            ],
          ),
        ));
  }
}
