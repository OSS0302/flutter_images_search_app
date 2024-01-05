
import 'package:flutter_image_search_app/domain/model/image_item.dart';
import 'package:flutter_image_search_app/result_core/result.dart';
// 인터페이스 ImageItemRepository
abstract interface class ImageItemRepository {
  Future<Result<List<ImageItem>>> getImageItems(String query);
}

