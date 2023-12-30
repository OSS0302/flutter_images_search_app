import 'package:flutter_image_search_app/dto/pixabay_dto.dart';
import 'package:flutter_image_search_app/model/item_image.dart';

extension ToModel  on Hits {
  ItemImage toItemImage() {
      return ItemImage(
        imageUrl: previewURL ?? '이미지가 없습니다',
        type : type ?? '',
        tags : tags ?? '',

    );
  }
}