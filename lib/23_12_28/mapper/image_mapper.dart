

import 'package:flutter_image_search_app/23_12_28/dto/piabay_dto.dart';
import 'package:flutter_image_search_app/23_12_28/model/image_item.dart';

extension DtoToModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(
      imageUrl: previewURL ??
          'https://cdnimg.melon.co.kr/cm2/artistcrop/images/002/61/143/261143_20210325180240_org.jpg?61e575e8653e5920470a38d1482d7312/melon/optimize/90',
      tags: tags ?? '',
    );
  }
}