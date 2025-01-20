import 'package:chat_app/features/home_screen.dart/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // add event from here ass sign out.
                  context.read<HomeCubit>().signOut();
                },
                child: Text("sign out")),
            Text("Home screen"),
          ],
        ),
      ),
    );
  }
}
