import 'package:flutter_image_search_app/23_12_27/repository/image_item_repository.dart';

import '../model/image_item.dart';

class MainViewModel {
  final repository = PixabayImageItemRepository();
  List<ImageItem> imageItems = [];
  List<ImageItem> _imageItems = [];
  bool isLoading = false;

  //수정 안되게 하는 리스트 (UnmodifiableListView)
  List<ImageItem> get imageItemList => List.unmodifiable(_imageItems);


  Future<void> searchImage(String query) async {
    imageItems = await repository.getImageItems(query);
    _imageItems = await repository.getImageItems(query);
  }
}
