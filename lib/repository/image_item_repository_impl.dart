import 'package:flutter_image_search_app/data_source/pixabay_api.dart';
import 'package:flutter_image_search_app/mapper/image_mapper.dart';
import 'package:flutter_image_search_app/model/image_item.dart';
import 'package:flutter_image_search_app/repository/image_item_repository.dart';
import 'package:flutter_image_search_app/result_core/result.dart';

@override
class ImageItemRepositoryImpl implements ImageItemRepository {
  // 구현
  final _api = PixabayApi();

  @override
  Future<Result<List<ImageItem>>> getImageItems(String query) async {
    try {
      final dto = await _api.getImagesResult(query);

      if (dto.hits == null) {
        return const Result.success([]);
      }

      return Result.success(dto.hits!.map((e) => e.toImageItem()).toList());
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }


}