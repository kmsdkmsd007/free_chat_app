import 'package:chat_app/features/contact_user/contact_user%20bloc/contact_user_bloc.dart';
import 'package:chat_app/features/conversation/conversation_model.dart';
import 'package:chat_app/features/conversation/cubit/conversation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationScreen extends StatelessWidget {
  ConversationScreen({super.key, required this.username, required this.userId});
  final String username;
  final String userId;
  final _msessagecontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
      body: Column(
        children: [
          BlocBuilder<ConversationCubit, ConversationState>(
            builder: (context, state) {
              if (state is ContactUserLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ConversationLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ConversationSuccess) {
                return ListView.builder(
                  itemCount: state.conversations.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(state.conversations[index].content),
                      title: Text(
                          state.conversations[index].contentType.toString()),
                    );
                  },
                );
              }
              return Container();
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.attachment),
                      onPressed: () {
                        // Implement file select functionality
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: _msessagecontroler,
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        // context
                        //     .read<ConversationCubit>()
                        //     .findCommonChat(userId);
                        // print('hi');
                        context.read<ConversationCubit>().insertConversation(
                            createConversationModel(
                                senderId: '',
                                contentType: "1",
                                content: _msessagecontroler.text),
                            userId);
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
