import 'package:flutter/material.dart';
import 'package:flutter_image_search_app/repository/image_item_repository.dart';
import 'package:flutter_image_search_app/ui/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  MainState _state = MainState(
    imageItems: List.unmodifiable([]),
    isLoading: false,
  );

  MainState get state => _state;

  MainViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;



  Future<void> searchImage(String query) async {
      // 로딩기호
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    _state = state.copyWith(
      isLoading: false,
      imageItems: List.unmodifiable(
          (await _repository.getImageItems(query)).take(5).toList()),
    );
      notifyListeners();
  }
}
