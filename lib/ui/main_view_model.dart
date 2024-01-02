import 'package:flutter/material.dart';
import '../model/image_item.dart';
import '../repository/image_item_repository.dart';

class MainViewModel extends ChangeNotifier {
  final repository = PixabayImageItemRepository();

  List<ImageItem> imageItems = [];

  bool isLoading = false;

  Future<void> searchImage(String query) async {
    isLoading = true;
    notifyListeners();

    imageItems = await repository.getImageItems(query);
    isLoading = false;
    notifyListeners();
  }
}