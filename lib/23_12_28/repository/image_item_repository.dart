import 'package:flutter_image_search_app/23_12_28/data_source/pixabay_api.dart';
import 'package:flutter_image_search_app/23_12_28/mapper/image_mapper.dart';
import 'package:flutter_image_search_app/23_12_28/model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}

@override
class PixabayImageItemRepository implements ImageItemRepository {
  final api = PixabayApi();
  @override
  Future<List<ImageItem>> getImageItems(String query) async {
   final dto =  await api.getImagesResult(query);

   if(dto == null ){
     return [];
   }
   return dto.hits!.map((value) => value.toImageItem()).toList();
  }
}
