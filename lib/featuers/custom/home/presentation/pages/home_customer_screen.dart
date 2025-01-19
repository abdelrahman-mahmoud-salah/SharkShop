import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/animation/animation_do.dart';
import 'package:flutter_application_2/core/di/dependency_injection.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_application_2/featuers/admin/categories/presentation/blocs/get_all_category_bloc/getallcategory_bloc.dart';
import 'package:flutter_application_2/featuers/custom/favourite/presentation/blocs/cubit/favourites_cubit.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_category_bloc/getallcategory_bloc.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_category_bloc/getallcategory_incustomer_event.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/blocs/get_all_product/get_all_product_event.dart';
import 'package:flutter_application_2/featuers/custom/home/presentation/pages/home_customer_screen_boody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCustomerScreen extends StatefulWidget {
  const HomeCustomerScreen({super.key});

  @override
  State<HomeCustomerScreen> createState() => _HomeCustomerScreenState();
}

class _HomeCustomerScreenState extends State<HomeCustomerScreen> {
  final scrollCotroller = ScrollController();
@override
  void initState() {
  
    super.initState();
  }
  @override
  void dispose() {
    scrollCotroller.dispose();
    super.dispose();
  }

  void scrollUp() {
    scrollCotroller.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetallcategoryInCustomerBloc>()
            ..add(const GetAllCategoryInCustomerSuccessEvent()),
        ),
        BlocProvider(
          create: (context) =>
              sl<AllProductCustomerBloc>()..add(const GetAllProductCustomer()),
        ),
       
      ],
      child: Stack(children: [
        HomeCustomerScreenBoody(controller: scrollCotroller),
        CustomFadeInLeft(
          duration: 200,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: FloatingActionButton(
                onPressed: scrollUp,
                backgroundColor: context.mycolors.bluePinkLight,
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
