import 'package:chat_app/features/user_info/user_info%20cubit/userInfo_cubit.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final TextEditingController c = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile Info",
          style: TextStyle(
              fontSize: 25,
              color: const Color.fromARGB(255, 31, 65, 187),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer<ImageCubit, ImageState>(listener: (a, b) {
        if (b is ImageErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(b.errorMessage.toString())));
        }
      }, builder: (context, state) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: TextFormField(
                controller: c,
              ),
            ),
            state is ImageLoadedState
                ? Image.file(
                    File(state.imagePath),
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : ElevatedButton(
                    onPressed: () {
                      context.read<ImageCubit>().pickImage();
                    },
                    child: Text("Pick Image")),
            ElevatedButton(
                onPressed: () {
                  if (state is ImageLoadedState) {
                    context
                        .read<ImageCubit>()
                        .profileUpdate(c.text, state.imagePath);
                  }
                },
                child: Text("Update"))
          ],
        ));
      }),
    );
  }
}
