import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/text_app.dart';
import 'package:flutter_application_2/core/di/dependency_injection.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/users/domain/entities/get_all_user_repo_entities.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/blocs/delete_user/delete_user_bloc.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/widgets/delete_user_view.dart';
import 'package:flutter_application_2/featuers/admin/users/presentation/widgets/titel_row_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersTableView extends StatelessWidget {
  const UsersTableView({super.key, required this.model});
  final List<GetAllUsersRepoModelEntities> model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DeleteUserBloc>(),
      child: Table(
        border: TableBorder.all(
          color: context.mycolors.bluePinkLight!,
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(100.w),
          1: const FlexColumnWidth(),
          2: FixedColumnWidth(100.w)
        },
        children: [
          TableRow(
              decoration: BoxDecoration(color: context.mycolors.bluePinkDark),
              children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: TitelRowTable(
                      icon: Icons.person,
                      text: context.lang.name,
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: TitelRowTable(
                      icon: Icons.email,
                      text: context.lang.email,
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: TitelRowTable(
                      icon: Icons.delete,
                      text: context.lang.delete,
                      fontSize: 15.sp,
                    )),
              ]),
          ...List.generate(
            model.length,
            (index) {
              return TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: TextApp(
                      text: model[index].name,
                      textAlign: TextAlign.center,
                      theme: context.textStyle.copyWith(
                          color: context.mycolors.textColorInButton,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: TextApp(
                      text: model[index].email,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      theme: context.textStyle.copyWith(
                          color: context.mycolors.textColorInButton,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    )),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: DeleteUserView(
                    IdUser: model[index].id.toString(),
                  ),
                ),
              ]);
            },
          ),
        ],
      ),
    );
  }
}
