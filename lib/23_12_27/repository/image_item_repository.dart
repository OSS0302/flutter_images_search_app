import 'package:flutter_image_search_app/data_source/pixabay_api.dart';
import 'package:flutter_image_search_app/mapper/image_mapper.dart';
import 'package:flutter_image_search_app/model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}

@override
class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImagesResult(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}

class MockImageItemRepository implements ImageItemRepository {
  @override
  Future<List<ImageItem>> getImageItems(String query) async {
   await Future.delayed(Duration(seconds: 1));
    if (query == 'apple') {
      return [
        ImageItem(
            imageUrl:
              "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
             tags: ''
        ),
        ImageItem(
            imageUrl: "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
             tags: ''
        ),
        ImageItem(
            imageUrl: "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
             tags: ''
        ),
      ];
    }else{
      return[
        ImageItem(imageUrl: "https://cdn.pixabay.com/photo/2015/03/14/19/45/suit-673697_150.jpg", tags: ''),
        ImageItem(imageUrl: "https://cdn.pixabay.com/photo/2015/03/14/19/45/suit-673697_150.jpg", tags: ''),
        ImageItem(imageUrl: "https://cdn.pixabay.com/photo/2015/03/14/19/45/suit-673697_150.jpg",tags: ''),
      ];
    }
  }

}
