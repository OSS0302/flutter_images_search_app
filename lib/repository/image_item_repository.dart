
import 'package:flutter_image_search_app/data_source/pixabay_api.dart';
import 'package:flutter_image_search_app/mapper/image_mapper.dart';
import 'package:flutter_image_search_app/model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}

@override
class PixabayItemRepository implements ImageItemRepository {
    final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImagesResult(query);
    return dto.hits!.map((e) => e.toImageItem()).toList();

  }

}