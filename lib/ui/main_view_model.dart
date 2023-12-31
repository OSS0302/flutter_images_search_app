import 'package:flutter_image_search_app/23_12_27/repository/image_item_repository.dart';

import '../model/image_item.dart';

class MainViewModel {
  final repository = PixabayImageItemRepository();
  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String query) async {
    imageItems = await repository.getImageItems(query);

  }
}
