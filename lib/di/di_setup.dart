import 'package:flutter_image_search_app/data/repository/image_item_repository_impl.dart';
import 'package:flutter_image_search_app/data/repository/star_repository_impl.dart';
import 'package:flutter_image_search_app/domain/repository/image_item_repository.dart';
import 'package:flutter_image_search_app/domain/repository/star_repository.dart';
import 'package:flutter_image_search_app/domain/use_case/search_image_use_case.dart';
import 'package:flutter_image_search_app/persentation/main_veiw_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  // 인터페이스 레포지토 싱글톤
  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImpl());

  getIt.registerSingleton<StarRepository>(StarRepositoryImpl());

  // getIt.registerSingleton<SearchI>(instance)
  // 뷰모델 : 팩토리
    getIt.registerSingleton<SearchImageUseCase>(
      SearchImageUseCase(
        imageItemRepository: getIt<ImageItemRepository>(),
        starRepository: getIt<StarRepository>(),
      ),

  );
  //뷰모델 : 팩토리
  getIt.registerFactory<MainViewModel>(
      () => MainViewModel(searchImageUseCase: getIt<SearchImageUseCase>()));
}
