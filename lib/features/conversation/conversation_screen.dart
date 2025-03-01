import 'package:chat_app/features/contact_user/contact_user%20bloc/contact_user_bloc.dart';
import 'package:chat_app/features/conversation/cubit/conversation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
      body: BlocBuilder<ConversationCubit, ConversationState>(
        builder: (context, state) {
          if (state is ContactUserLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ConversationLoading) {
            return Center(
              child: Text('Something went wrong'),
            );
          }
          if (state is ConversationSuccess) {
            return ListView.builder(
              itemCount: state.conversations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/well.png"),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
