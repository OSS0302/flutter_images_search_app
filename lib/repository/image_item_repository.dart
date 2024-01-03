
import 'package:flutter_image_search_app/model/image_item.dart';
// 인터페이스 ImageItemRepository
abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}

