import 'package:flutter_image_search_app/repository/image_item_repository.dart';
import 'package:flutter_image_search_app/repository/image_item_repository_impl.dart';
import 'package:flutter_image_search_app/ui/main_veiw_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  // 인터페이스 싱글톤
  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImpl());

  // 뷰모델 : 팩토리
  getIt.registerFactory<MainViewModel>(
          () => MainViewModel(repository: getIt<ImageItemRepository>()));
  }
