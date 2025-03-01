import 'package:chat_app/features/user_info/user_info%20cubit/userInfo_cubit.dart';
import 'package:chat_app/utils/custom_text.dart';
import 'package:chat_app/utils/navigation.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  UserInfoScreenState createState() => UserInfoScreenState();
}

class UserInfoScreenState extends State<UserInfoScreen> {
  final TextEditingController c = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(Icons.sign_language),
            onTap: () async {
              await Supabase.instance.client.auth
                  .signOut(scope: SignOutScope.global);
            },
          )
        ],
        title: Text(
          "User Info",
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            state is ImageLoadedState
                ? CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(File(state.imagePath)),
                  )
                : ElevatedButton(
                    onPressed: () {
                      context.read<ImageCubit>().pickImage();
                    },
                    child: Text("Pick Image")),
            Padding(
              padding: const EdgeInsets.only(
                  left: 80, right: 80, top: 30, bottom: 30),
              child: Form(
                key: _formkey,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Your name",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.blueGrey),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Reqiured";
                    }
                    return null;
                  },
                  controller: c,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    if (state is ImageLoadedState) {
                      if (state.imagePath.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please provide the images')));
                      } else {
                        context
                            .read<ImageCubit>()
                            .profileUpdate(c.text, state.imagePath);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please provide the images')));
                    }
                    // navigatorKey.currentState!.pushNamed(Routes.home);
                  }
                },
                child: CustomText(
                  text: "Update",
                  size: 20,
                  fontWeight: FontWeight.w600,
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.chats);
                },
                child: Text("Skip"))
          ],
        ));
      }),
    );
  }
}
