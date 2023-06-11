part of 'images_provider.dart';

abstract class ImagesState extends Equatable {
  const ImagesState();

  @override
  List<Object> get props => [];
}

class ImagesInitial extends ImagesState {}

class ImagesLoading extends ImagesState {}

class ImagesLoaded extends ImagesState {
  final List<ImageModel> images;
  const ImagesLoaded({
    required this.images,
  });

  @override
  List<Object> get props => [images];
}

class ImagesError extends ImagesState {
  final String errorText;
  const ImagesError({
    required this.errorText,
  });

  @override
  List<Object> get props => [errorText];
}
