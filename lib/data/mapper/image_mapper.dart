
import 'package:flutter_image_search_app/data/dto/pixabay_dto.dart';
import 'package:flutter_image_search_app/domain/model/image_item.dart';

extension DtoToModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(
      imageUrl: previewURL ?? '이미지가 없습니다. 다시 확인해주세요',
      tags: tags ?? '',
    );
  }
}
