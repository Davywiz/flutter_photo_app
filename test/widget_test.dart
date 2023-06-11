import 'package:flutter_photo_app/data/api.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getImages', () {
    test('should return a response with status code 200', () async {
      final api = AppApi();

      final images = await api.getImages(page: '2');
      // Verify the response status code
      expect(
        images.statusCode,
        200,
      );
    });

    test('should return an image list of 2 images', () async {
      final api = AppApi();

      final images = await api.getImages(page: '2');
      final listOfImages = images.data as List;
      // Verify the list of images is two
      expect(
        listOfImages.length,
        2,
      );
    });
  });
}
