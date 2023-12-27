import 'dart:convert';

import 'package:flutter_image_search_app/dto/pixabay_dto.dart';
import 'package:flutter_image_search_app/key.dart';

import 'package:http/http.dart' as http;

class PixabayApi {
  Future<PixabayDto> getImagesResult(String query) async {

    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=$key=$query&image_type=photo'));
    return PixabayDto.fromJson(jsonDecode(response.body));
  }
}