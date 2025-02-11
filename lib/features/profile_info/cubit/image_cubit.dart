import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitialState());

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final pickImage =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        emit(ImageLoadedState(imagePath: pickImage.path));
      } else {
        emit(ImageErrorState(errorMessage: "Not yet selected the image"));
      }
    } catch (e) {
      ImageErrorState(errorMessage: e.toString());
    }
  }

  Future<void> reSent() async {
    emit(ImageInitialState());
  }

  Future<void> profileUpdate(String name, String profilePic) async {
    try {
      await Supabase.instance.client.from("profiles").insert({
        "id": Supabase.instance.client.auth.currentUser!.id,
        'email': Supabase.instance.client.auth.currentUser!.email,
        'name': name,
        'profile_picture': profilePic,
      });
    } catch (e) {}
  }
}
