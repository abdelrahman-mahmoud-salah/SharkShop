
import 'dart:io';

import '../model/upload_image_response.dart';
import '../../../services/api_error_handler.dart';


import '../data_source/upload_image_data_source.dart';

class UploadImageRepo {
  const UploadImageRepo(this._dataSource);

  final UploadImageDataSource _dataSource;

  Future<ApiResult<UploadImageResourse>> uploadImage(File imageFile) async {
    try {
  
      final response = await _dataSource.uploadImage(imageFile: imageFile);

      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please, try agian we have error');
    }
  }
}
