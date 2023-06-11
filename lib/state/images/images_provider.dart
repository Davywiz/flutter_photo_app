import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/api.dart';
import '../../models/image_model.dart';

part 'images_state.dart';

class ImagesNotifier extends StateNotifier<ImagesState> {
  ImagesNotifier(this.api) : super(ImagesInitial());
  late final AppApi api;

  getImagesList(String page) async {
    state = ImagesLoading();

    try {
      final response = await api.getImages(page: page);

      final List imageData = response.data as List;
      final List<ImageModel> imageList =
          imageData.map((data) => ImageModel.fromMap(data)).toList();

      state = ImagesLoaded(images: imageList);
    } catch (error) {
      state = ImagesError(errorText: error.toString());
    }
  }
}
