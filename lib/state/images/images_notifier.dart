import 'package:flutter_photo_app/data/api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'images_provider.dart';

final imagesProvider = StateNotifierProvider<ImagesNotifier, ImagesState>(
  (ref) {
    final api = AppApi();
    return ImagesNotifier(api);
  },
);
