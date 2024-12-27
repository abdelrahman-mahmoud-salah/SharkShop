import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/error_screen.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/di/dependency_injection.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/custom/profile/data/models/user_info_model_repo.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/blocs/bloc/user_info_bloc.dart';
import 'package:flutter_application_2/featuers/custom/profile/presentation/blocs/bloc/user_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserNameAvatar extends StatelessWidget {
  const UserNameAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        if (state.status == UserInfoStatus.loading) {
          return const Skeletonizer(
            effect: ShimmerEffect(),
            enabled: true,
            child: UserNameAvatarBody(),
          );
        } else if (state.status == UserInfoStatus.error) {
          return ErrorScreen(); // Error handling
        } else if (state.status == UserInfoStatus.loaded &&
            state.userInfo != null) {
          return UserNameAvatarBody(
            userInfo: state.userInfo!,
          );
        } else {
          return const UserNameAvatarBody(// Fallback for unexpected states
              );
        }
      },
    );
  }
}

class UserNameAvatarBody extends StatelessWidget {
  const UserNameAvatarBody({super.key, this.userInfo});
  final UserInfoModelRepo? userInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
            height: 80.h,
            width: 80.w,
            fit: BoxFit.fill,
            imageUrl: userInfo?.avatar ??
                "https://yt3.ggpht.com/-MlnvEdpKY2w/AAAAAAAAAAI/AAAAAAAAAAA/tOyTWDyUvgQ/s900-c-k-no-mo-rj-c0xffffff/photo.jpg",
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
              size: 70,
            ),
            placeholder: (context, url) =>
                const CircularProgressIndicator(), // Add a placeholder
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextApp(
          text: userInfo?.name ?? "User Name",
          theme: context.textStyle.copyWith(
            color: context.mycolors.textcolor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextApp(
          text: userInfo?.email ?? "email@example.com",
          theme: context.textStyle.copyWith(
            color: context.mycolors.textcolor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
