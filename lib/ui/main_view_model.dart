import 'dart:async';

import 'package:flutter_image_search_app/23_12_27/repository/image_item_repository.dart';

import '../model/image_item.dart';

class MainViewModel {
  final repository = PixabayImageItemRepository();
  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);

  final _streamLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream => _streamLoadingController.stream;

  Future<void> searchImage(String query) async {

    // 화면의 갱신
    _streamLoadingController.add(true);

    _imageItems = await repository.getImageItems(query);

    //화면의 갱신
    _streamLoadingController.add(false);
  }
}
