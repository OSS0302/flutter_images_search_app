import 'package:flutter_image_search_app/domain/model/star.dart';
import 'package:flutter_image_search_app/domain/repository/star_repository.dart';

class StarRepositoryImpl implements StarRepository {
  final List<Star> star = [
    Star(
        id: 1,
        title: '고윤정',
        subTitle: '여배우 고윤정',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/44/210604_%EA%B3%A0%EC%9C%A4%EC%A0%95%282%29.jpg',
        decrption: '고윤정 배우 는 무빙드라마에서 나온 배우입니다 '
    ),
    Star(
        id: 2,
        title: '한소희',
        subTitle: '여배우 한소희',
        imageUrl: 'https://img.allurekorea.com/allure/2022/01/style_61e56285d36ed-833x1200.jpg',
        decrption: '마이네임 드라마에 나온 배우는 한소희입니다.'
    )
  ];


  @override
  List<Star> getStars() {
    return getStars();
  }
}
