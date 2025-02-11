part of 'image_cubit.dart';

sealed class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

final class ImageInitialState extends ImageState {}

final class ImageLoadedState extends ImageState {
  final String imagePath;
  const ImageLoadedState({required this.imagePath});
}

final class ImageLoadingState extends ImageState {
  const ImageLoadingState();
}

final class ImageErrorState extends ImageState {
  final String errorMessage;
  const ImageErrorState({required this.errorMessage});
}
