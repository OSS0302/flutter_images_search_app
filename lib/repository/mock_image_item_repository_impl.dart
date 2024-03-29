import 'package:flutter_image_search_app/model/image_item.dart';
import 'package:flutter_image_search_app/repository/image_item_repository.dart';
import 'package:flutter_image_search_app/result_core/result.dart';

class MockImageItemRepositoryImpl implements ImageItemRepository {
  // 목업 데이터 구현
  @override
  Future<Result<List<ImageItem>>> getImageItems(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    if (query == 'apple') {
      return Result.success([
        ImageItem(
            imageUrl:
            "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
            tags: ''),
        ImageItem(
            imageUrl:
            "https://cdn.pixabay.com/photo/2017/09/26/13/39/apples-2788651_150.jpg",
            tags: ''),
        ImageItem(
            imageUrl:
            "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
            tags: ''),
      ]);
    } else {
      return Result.success([
        ImageItem(
            imageUrl:
            "https://cdn.pixabay.com/photo/2015/03/14/19/45/suit-673697_150.jpg",
            tags: ''),
        ImageItem(
            imageUrl:
            "https://cdn.pixabay.com/photo/2019/09/21/09/07/banana-4493420_150.jpg",
            tags: ''),
      ]);
    }
  }
}