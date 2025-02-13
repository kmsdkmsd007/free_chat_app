import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/utils/navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'userInfo_state.dart';

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

  Future<String> uploadPHotoAndGetLink(String photoLocalPath) async {
    try {
      await Supabase.instance.client.storage
          .from('profile pictures')
          .upload(photoLocalPath.split('/').last, File(photoLocalPath));

      // if (response.error != null) {
      //   throw Exception(response.error!.message);
      // }

      final publicUrl = Supabase.instance.client.storage
          .from("profile pictures")
          .getPublicUrl(photoLocalPath.split('/').last);
      return publicUrl;
    } catch (e) {
      print(e.toString());
      throw Exception('Faild to upload photo: $e');
    }
  }

  Future<void> profileUpdate(String name, String profilePic) async {
    try {
      var link = await uploadPHotoAndGetLink(profilePic);
      // await Supabase.instance.client.from("profiles").insert({
      //   "id": Supabase.instance.client.auth.currentUser!.id,
      //   'email': Supabase.instance.client.auth.currentUser!.email,
      //   'name': name,
      //   'profile_picture': link,
      // });
      var metadata = {
        'name': name,
        'profile_picture': link,
      };
      await Supabase.instance.client.auth
          .updateUser(UserAttributes(data: metadata));
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text("Sorry there was an error")));
      navigatorKey.currentState!.pushReplacementNamed(Routes.home);
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text("Sorry there was an error")));
      print(e.toString());
    }
  }
}
