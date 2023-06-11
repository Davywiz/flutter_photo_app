<h1 align="center">:image: Image Gallery App :image:</h1>


<p align="center"><b>Image Gallery App made in Flutter</b>.</p>


## Screenshots
<table>
    <tr>
        <td><img src="https://github.com/Davywiz/flutter_photo_app/blob/master/screenshots/images_project1.jpg?raw=true"></td>
        <td><img src="https://github.com/Davywiz/flutter_photo_app/blob/master/screenshots/images_project2.jpg?raw=true"></td>
        <td><img src="https://github.com/Davywiz/flutter_photo_app/blob/master/screenshots/images_project3.jpg?raw=true"></td>
    </tr>
</table>


## Steps to recreate
<p>
- Clone repository</p>
<p >-  Run flutter pub get (to get all the packages in the pubspec.yaml)</p>
<p >- Run tests with "flutter test"
</p>

## Design Choice
<p>
The Architecture followed in this project is the clean Architecture, separation of concerns in provider, repository and data.

State Management solution used was Riverpod
Routing done with Go-Router

Images are being cached in the GridView By caching images, subsequent requests for the same image can be served from the local cache instead of making a network request. This reduces the loading time, as the images are already stored locally on the device.
</p>


## Dependencies

- [go_router](https://pub.dev/packages/go_router)
- [dio](https://pub.dev/packages/dio)
- [hooks_riverpod](https://pub.dev/packages/hooks_riverpod)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination)


## Dev Dependencies

- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)


## Credits

- [Punk API](https://punkapi.com/documentation/v2)


## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
