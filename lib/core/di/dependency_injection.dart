import 'package:flutter/material.dart';
import '../app/Appcubit/app_cubit.dart';
import '../app/upload_image/cubit/upload_image_cubit.dart';
import '../app/upload_image/data_source/upload_image_data_source.dart';
import '../app/upload_image/repo/upload_image_repo.dart';
import '../services/api_services.dart';
import '../services/dio_intersptor.dart';
import '../../featuers/admin/categories/data/data_sources/remote/create_category/create_category_remote_data.dart';
import '../../featuers/admin/categories/data/data_sources/remote/create_category/create_category_remote_impl.dart';
import '../../featuers/admin/categories/data/data_sources/remote/dalete_category/delete_category_remote.dart';
import '../../featuers/admin/categories/data/data_sources/remote/dalete_category/delete_category_remote_impl.dart';
import '../../featuers/admin/categories/data/data_sources/remote/get_all_category/get_all_catedory_remote.dart';
import '../../featuers/admin/categories/data/data_sources/remote/get_all_category/get_all_catedory_remote_impl.dart';
import '../../featuers/admin/categories/data/data_sources/remote/update_category/update_category_remote.dart';
import '../../featuers/admin/categories/data/data_sources/remote/update_category/update_category_remote_impl.dart';
import '../../featuers/admin/categories/data/repositories_impl/create_category/create_category_erpo_impl.dart';
import '../../featuers/admin/categories/data/repositories_impl/dalete_category/delete_repo_impl.dart';
import '../../featuers/admin/categories/data/repositories_impl/get_all_category/get_all_category_repo_impl.dart';
import '../../featuers/admin/categories/data/repositories_impl/update_category/update_category_repo_impl.dart';
import '../../featuers/admin/categories/domain/repositories/create_category/create_category_repo.dart';
import '../../featuers/admin/categories/domain/repositories/dalete_category/delete_category_repo.dart';
import '../../featuers/admin/categories/domain/repositories/get_all_category/get_all_category_repo.dart';
import '../../featuers/admin/categories/domain/repositories/update_category/update_category_repo.dart';
import '../../featuers/admin/categories/domain/use_cases/create_category/create_category_use_case.dart';
import '../../featuers/admin/categories/domain/use_cases/dalete_category/delete_category_use_case.dart';
import '../../featuers/admin/categories/domain/use_cases/get_all_category/get_all_category_use_case.dart';
import '../../featuers/admin/categories/domain/use_cases/update_category/update_category_use_case.dart';
import '../../featuers/admin/categories/presentation/blocs/create_categoy/create_category_bloc.dart';
import '../../featuers/admin/categories/presentation/blocs/delete_category/delete_category_bloc.dart';
import '../../featuers/admin/categories/presentation/blocs/get_all_category_bloc/getallcategory_bloc.dart';
import '../../featuers/admin/categories/presentation/blocs/update_category/update_category_bloc.dart';

import '../../featuers/admin/dashboard/presentation/blocs/productNumber/product_number_bloc.dart';
import '../../featuers/admin/products/data/data_source/remote/get_all_product/get_all_product_remote.dart';
import '../../featuers/admin/products/data/data_source/remote/get_all_product/get_all_product_remote_impl.dart';
import '../../featuers/admin/products/data/repositories_impl/get_all_product/get_all_product_repo_impl.dart';
import '../../featuers/admin/products/domain/repositories/product_repo.dart';
import '../../featuers/admin/products/domain/use_cases/product_usecase.dart';
import '../../featuers/admin/products/presentation/blocs/get_all_product/get_all_product_bloc.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> setupInjector() async {
  await _initCore();
  await _ALlCategories();
  await _initNumberProduct();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  sl
    ..registerFactory<AppCubit>(AppCubit.new)
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerLazySingleton(() => UploadImageRepo(sl()))
    ..registerLazySingleton(() => UploadImageDataSource(sl()))
    ..registerFactory(() => UploadImageCubit(sl()))
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerLazySingleton<ApiManager>(() => ApiManager(dio));
}

Future<void> _initNumberProduct() async {
  sl
    ..registerLazySingleton<GetAllProductRemote>(
      () => GetAllProductRemoteImpl(sl<ApiManager>()),
    )
    ..registerLazySingleton<GetAllProductRepo>(
      () => GetAllProductRepoImpl(sl<GetAllProductRemote>()),
    )
    ..registerLazySingleton<GetAllProductUsecase>(
      () => GetAllProductUsecase(sl<GetAllProductRepo>()),
    )
    ..registerFactory<ProductNumberBloc>(
      () => ProductNumberBloc(sl<GetAllProductUsecase>()),
    )
    ..registerFactory<GetAllProductBloc>(
      () => GetAllProductBloc(sl<GetAllProductUsecase>()),
    )
    ;
}

Future<void> _ALlCategories() async {
  sl
    ..registerLazySingleton<GetAllCatedoryRemote>(
      () => GetAllCatedoryRemoteImpl(sl<ApiManager>()),
    )
    ..registerLazySingleton<GetAllCategoryRepository>(
      () => GetAllCategoryRepoImpl(sl<GetAllCatedoryRemote>()),
    )
    ..registerLazySingleton<GetAllCategoryUseCase>(
      () => GetAllCategoryUseCase(sl<GetAllCategoryRepository>()),
    )
    ..registerFactory<GetallcategoryBloc>(
      () => GetallcategoryBloc(sl<GetAllCategoryUseCase>()),
    )
    ..registerLazySingleton<CreateCategoryRemoteData>(
      () => CreateCategoryRemoteImpl(sl<ApiManager>()),
    )
    ..registerLazySingleton<CreateCategoryRepo>(
      () => CreateCategoryRepoImpl(sl<CreateCategoryRemoteData>()),
    )
    ..registerLazySingleton<CreateCategoryUseCase>(
      () => CreateCategoryUseCase(sl<CreateCategoryRepo>()),
    )
    ..registerFactory<CreateCategoryBloc>(
      () => CreateCategoryBloc(sl<CreateCategoryUseCase>()),
    )
    ..registerLazySingleton<DeleteCategoryRemote>(
        () => DeleteCategoryRemoteImpl(sl<ApiService>()))
    ..registerLazySingleton<DeleteCategoryRepo>(
      () => DeleteCategoryRepoImpl(sl<DeleteCategoryRemote>()),
    )
    ..registerLazySingleton<DeleteCategoryUseCase>(
      () => DeleteCategoryUseCase(sl<DeleteCategoryRepo>()),
    )
    ..registerFactory<DeleteCategoryBloc>(
      () => DeleteCategoryBloc(sl<DeleteCategoryUseCase>()),
    )
    ..registerLazySingleton<UpdateCategoryRemote>(
      () => UpdateCategoryRemoteImpl(sl<ApiManager>()),
    )
    ..registerLazySingleton<UpdateCategoryRepository>(
      () => UpdateCategoryRepoImpl(sl<UpdateCategoryRemote>()),
    )
    ..registerLazySingleton<UpdateCategoryUseCase>(
        () => UpdateCategoryUseCase(sl<UpdateCategoryRepository>()))
    ..registerFactory<UpdateCategoryBloc>(
      () => UpdateCategoryBloc(sl<UpdateCategoryUseCase>()),
    );
}

// Future<void> _initLogin() async {
//   sl
//     ..registerFactory(
//       () => LoginBloc(sl()),
//     )
//     ..registerLazySingleton(() => LoogInRemotedsImplementation(sl()))
//     ..registerLazySingleton(() => LoginRepository,)
//     ..registerLazySingleton(() => LoginRepoImple(sl()))
//     ..registerLazySingleton(
//       () => LoginUseCase(sl()),
//     );
// }
