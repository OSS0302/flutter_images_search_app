import 'dart:convert';

import 'package:flutter_image_search_app/key.dart';

class PixabayApi{
  Future<PixabayDto> getImagesResult(String query) async {
    final apiResponse = await Uri.parse('https://pixabay.com/api/?key=$key=$query&image_type=photo');
      return PixabayDto.from(jsonDecode(apiResponse.body));
  }
}