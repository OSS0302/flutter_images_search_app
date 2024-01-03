import 'package:flutter_image_search_app/data_source/pixabay_api.dart';
import 'package:flutter_image_search_app/mapper/image_mapper.dart';
import 'package:flutter_image_search_app/model/image_item.dart';
import 'package:flutter_image_search_app/repository/image_item_repository.dart';

@override
class ImageItemRepositoryImpl implements ImageItemRepository {
  // 구현
  final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImagesResult(query);
    return dto.hits!.map((e) => e.toImageItem()).toList();

  }

}