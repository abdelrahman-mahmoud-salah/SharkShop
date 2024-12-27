import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/app/Appcubit/app_cubit.dart';
import '../../../../../core/common/widget/cutom_container_admin.dart';
import '../../../../../core/common/widget/text_app.dart';
import '../../../../../core/extension/context_extention.dart';
import 'delete/delete_category.dart';
import 'update/update_category_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.name,
    required this.image,
    required this.id,
  });
  final String name;
  final String image;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: context.read<AppCubit>().english == true
          ? ActionPane(
              motion: const BehindMotion(),
              children: [
                DeleteCategoryIcon(
                  Id: id,
                ),
                UpdateCategoryIcon(
                  id: id,
                  image: image,
                ),
              ],
            )
          : const ActionPane(motion: SizedBox.shrink(), children: []),
      // endActionPane: context.read<AppCubit>().english == false
      //     ? ActionPane(
      //         motion: const BehindMotion(),
      //         children: [
      //           SlidableAction(
      //             onPressed: (context) {},
      //             backgroundColor: Colors.red,
      //             foregroundColor: Colors.white,
      //             icon: Icons.delete,
      //             label: context.lang.delete,
      //           ),
      //           SlidableAction(
      //             onPressed: (context) {},
      //             backgroundColor: context.mycolors.bluePinkLight!,
      //             foregroundColor: Colors.white,
      //             icon: Icons.upload_sharp,
      //             label: context.lang.edit,
      //           ),
      //         ],
      //       )
      //     : const ActionPane(motion: SizedBox.shrink(), children: []),
      child: CustomContainerLinearAdmin(
          height: 150.h,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 160.w,
                        child: TextApp(
                            text: name.padRight(10),
                            textOverflow: TextOverflow.clip,
                            maxLines: 2,
                            softWrap: true,
                            theme: context.textStyle.copyWith(
                                fontSize: 25.sp,
                                color: context.mycolors.textColorInButton,
                                fontWeight: FontWeight.bold)),
                      ),
                      TextApp(
                          text: "20",
                          theme: context.textStyle.copyWith(
                              fontSize: 25.sp,
                              color: context.mycolors.textColorInButton,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                CachedNetworkImage(
                    errorWidget: (context, url, error) => Container(
                        height: 130.h,
                        width: 120.w,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://tse1.mm.bing.net/th?id=OIP.UYefmuqvYGCqQqZN9xaW8QHaGp&pid=Api&P=0&h=220"),
                              fit: BoxFit.fill,
                            ))),
                    imageBuilder: (context, imageProvider) => Container(
                          height: 130.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                    imageUrl: image)
              ],
            ),
          )),
    );
  }
}

// class UpdateCategory extends StatelessWidget {
//   const UpdateCategory({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SlidableAction(
//       onPressed: (context) {},
//       backgroundColor: context.mycolors.bluePinkLight!,
//       foregroundColor: Colors.white,
//       icon: Icons.edit,
//       label: context.lang.edit,
//     );
//   }
// }
