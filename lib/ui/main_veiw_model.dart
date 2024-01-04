import 'package:flutter/material.dart';
import 'package:flutter_image_search_app/model/image_item.dart';
import 'package:flutter_image_search_app/repository/image_item_repository.dart';
import 'package:flutter_image_search_app/result_core/result.dart';
import 'package:flutter_image_search_app/ui/main_state.dart';

final class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  // 얘만 변수
  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;

  Future<void> searchImage(String query) async {
    // 카피
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.getImageItems(query);

    switch(result) {
      //성공하면  리스트 이미지 아이템을 보여주는데 로딩 끄고 3개의 사진데이터만 보여줘
      case Success<List<ImageItem>>():
      // 로딩
        _state = state.copyWith(
          isLoading: false,
          imageItems: result.data.take(3).toList(),
        );
        notifyListeners();
        // 실패하면  에러문구 보여줘
      case Error<List<ImageItem>>():
        print('에러가 납니다. ');
      case Loading<List<ImageItem>>():
        print('로딩중');
    }
  }
}
