import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image_search_app/domain/repository/image_item_repository.dart';
import 'package:flutter_image_search_app/domain/model/image_item.dart';
import 'package:flutter_image_search_app/domain/use_case/search_image_use_case.dart';
import 'package:flutter_image_search_app/result_core/result.dart';
import 'package:flutter_image_search_app/persentation/main_event.dart';
import 'package:flutter_image_search_app/persentation/main_state.dart';

final class MainViewModel extends ChangeNotifier {
  final SearchImageUseCase _searchImageUseCase;
  // MainState는 변수 다.
  MainState _state = const MainState();

  MainState get state => _state;

  final _eventController = StreamController<MainEvent>();

  Stream<MainEvent> get eventStream => _eventController.stream;

  MainViewModel({
    required SearchImageUseCase searchImageUseCase,
  }) : _searchImageUseCase = searchImageUseCase;

  Future<void> searchImage(String query) async {
    // 카피
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _searchImageUseCase.excute(query);

    switch(result) {
      //성공하면  리스트 이미지 아이템을 보여주는데 로딩 끄고 3개의 사진데이터만 보여줘
      case Success<List<ImageItem>>():
      // 로딩
        _state = state.copyWith(
          isLoading: false,
          imageItems: result.data.take(3).toList(),
        );
        notifyListeners();
        _eventController.add(MainEvent.showSnackBar('성공!'));
        // 실패하면  에러문구 보여줘
      case Error<List<ImageItem>>():
        _eventController.add(MainEvent.showSnackBar('네트워크 연결 오류'));
      case Error<List<ImageItem>>():
        _eventController.add(MainEvent.showSnackBar('검색어를 연결해주세요'));
      case Loading<List<ImageItem>>():
        print('로딩중');
    }
  }
}
