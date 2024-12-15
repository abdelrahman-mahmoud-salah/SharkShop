
import 'dart:io';
import '../model/upload_image_response.dart';
import '../../../services/api_services.dart';


class UploadImageDataSource {
  const UploadImageDataSource(this._api);

  final ApiManager _api;

  Future<UploadImageResourse> uploadImage({
    required File imageFile,
  }) async {
 

    final response = await _api.uploadImage(imageFile);

    return response;
  }
}
