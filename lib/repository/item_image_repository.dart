import 'package:flutter_image_search_app/data_soure/piabay_api.dart';
import 'package:flutter_image_search_app/mapper/image_mapper.dart';
import 'package:flutter_image_search_app/model/item_image.dart';

abstract interface class  ItemImageRepository {
  Future<List<ItemImage>> getItemImage(String query);
}
class PixabayItemImageRepository implements ItemImageRepository {
  final _api  = PixabayApi();

  @override
  Future<List<ItemImage>> getItemImage(String query) async {
    final dto =await _api.getImagesResult(query);
    if(dto == null ){
      return [];
    }
    return dto.hits!.map((e) => e.toItemImage()).toList();
  }
}

