import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/create_product/create_product_repo_model.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/create_product/create_product_request_model.dart';
import 'package:flutter_application_2/featuers/admin/products/data/models/update/update_product_request_model.dart';
import 'package:flutter_application_2/featuers/admin/users/data/models/get_all_user_repo_model.dart';
import '../app/upload_image/model/upload_image_response.dart';
import 'api_endpoint.dart';
import '../../featuers/admin/categories/data/models/create_category/create_catecory_model_request.dart';
import '../../featuers/admin/categories/data/models/create_category/create_category_model_repo.dart';
import '../../featuers/admin/categories/data/models/get_all_category/get_all_category_repo_model.dart';
import '../../featuers/admin/products/data/models/get_all_product/product_repo_model.dart';
import '../../featuers/auth/login/data/models/login_repo_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiEndpoint.baseUrl)
abstract class ApiService {
  factory ApiService(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ApiService;

  @POST(ApiEndpoint.graphql)
  // ignore: non_constant_identifier_names
  Future<LoginResponseModel> Login(
    @Body() Map<String, dynamic> mutation,
  );
  @POST(ApiEndpoint.graphql)
  // ignore: non_constant_identifier_names
  Future<void> deletecategory(
    @Body() Map<String, dynamic> mutation,
  );
  @POST(ApiEndpoint.graphql)
  // ignore: non_constant_identifier_names
  Future<void> deleteProduct(
    @Body() Map<String, dynamic> mutation,
  );
  @POST(ApiEndpoint.graphql)
  Future<void> deleteUser(
    @Body() Map<String, dynamic> mutation,
  );
}

@RestApi(baseUrl: ApiEndpoint.baseUrl)
abstract class ApiManager {
  factory ApiManager(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ApiManager;

  @GET(ApiEndpoint.getallproduct)
  Future<List<ProductRepoModel>> getAllProduct();
  @GET(ApiEndpoint.getAllUser)
  Future<List<GetAllUsersRepoModel>> getAllUser();
  @GET(ApiEndpoint.getallCategory)
  Future<List<GetAllCategoryRepoModel>> getAllCategory();
  @MultiPart()
  @POST(ApiEndpoint.uploadImage)
  Future<UploadImageResourse> uploadImage(@Part() File parts);
  @POST(ApiEndpoint.createCategory)
  Future<CreateCategoryModelRepo> createCategory(
    @Body() CreateCatecoryModelRequest createCategoryModelRequest,
  );
  @POST(ApiEndpoint.createproduct)
  Future<CreateProductRepoModel> createProduct(
    @Body() CreateProductRequestModel createProductModelRequest,
  );
  @PUT("api/v1/categories/{id}")
  Future<CreateCategoryModelRepo> updateCategory(
    @Path('id') String id,
    @Body() CreateCatecoryModelRequest updateCategoryRequest,
  );
  @PUT("api/v1/products/{id}")
  Future<ProductRepoModel> updateProduct(
    @Path('id') String id,
    @Body() UpdateProductRequestModel updateProductRequest,
  );
}
