import 'package:flutter/material.dart';
import 'package:flutter_image_search_app/model/image_item.dart';
import 'package:flutter_image_search_app/repository/image_item_repository.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  MainViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;

  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> searchImage(String query) async {
    _isLoading = true;
    notifyListeners();

    _imageItems = (await _repository.getImageItems(query)).take(6).toList();

    _isLoading = false;
    notifyListeners();
  }
}
