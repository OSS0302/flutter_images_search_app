import 'package:flutter_image_search_app/domain/model/star.dart';

abstract interface class StarRepository {
  List<Star> getStars();
}