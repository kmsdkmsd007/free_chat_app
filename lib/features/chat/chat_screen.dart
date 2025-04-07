import 'package:chat_app/features/chat/cubit/chat_cubit.dart';
import 'package:chat_app/features/contact_user/cmodel.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final List<MyUser> chat = [];
  late ChatCubit chatCubit;
  @override
  void initState() {
    super.initState();
    chatCubit = context.read<ChatCubit>()..getAllChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Chats',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await Supabase.instance.client.auth
                  .signOut(scope: SignOutScope.global);
            },
          ),
        ],
      ),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return state is ChatLoading
              ? Center(child: CircularProgressIndicator())
              : state is ChatSuccess
                  ? ListView.builder(
                      itemCount: state.chats.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  state.chats[index].profilePicture!.isNotEmpty
                                      ? NetworkImage(
                                          state.chats[index].profilePicture!)
                                      : null,
                              backgroundColor: Colors.teal,
                              child: state.chats[index].profilePicture!.isEmpty
                                  ? Text(
                                      state.chats[index].username![0]
                                          .toUpperCase(),
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : null,
                            ),
                            subtitle: Text(
                              state.chats[index].lastMessage ?? "no message",
                              style: TextStyle(color: Colors.black54),
                            ),
                            title: Text(
                                state.chats[index].username ?? "no name ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            trailing: Text(
                              state.chats[index].messageTime != null
                                  ? "${state.chats[index].messageTime.hour}:${state.chats[index].messageTime.minute}"
                                  : "no time",
                              style: TextStyle(color: Colors.black54),
                            ),
                            onTap: () {
                              navigatorKey.currentState!
                                  .pushReplacementNamed('/conversation');
                            },
                          ),
                        );
                      },
                    )
                  : Center(child: Text('No chats found'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigatorKey.currentState!.pushReplacementNamed(Routes.contact);
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
      ),
    );
  }
}
