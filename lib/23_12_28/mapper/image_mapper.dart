import 'package:flutter_image_search_app/dto/pixabay_dto.dart';
import 'package:flutter_image_search_app/model/image_item.dart';

extension DtoToModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(
      imageUrl:previewURL ??
          '이미지가 없습니다.',
      tags: tags ?? '',
    );
  }
}