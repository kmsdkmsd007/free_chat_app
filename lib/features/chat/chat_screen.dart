import 'package:chat_app/features/chat/cubit/chat_cubit.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
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
        actions: [
          IconButton(
            icon: Icon(Icons.abc),
            onPressed: () async {
              await Supabase.instance.client.auth
                  .signOut(scope: SignOutScope.global);
              // Add search functionality
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
                            leading: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Text(state.chats[index].name ?? ""),
                              // ClipOval(
                              //   child: Image.network(

                              //     fit: BoxFit.cover,
                              //     width: 60,
                              //     height: 60,
                              //   ),
                              // ),
                            ),
                            title: Text(state.chats[index].name ?? "",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            // subtitle: Text(chats[index]["message"]!),
                            // trailing: Text(
                            //   chats[index]["time"]!,
                            //   style:
                            //       TextStyle(color: Colors.black, fontSize: 12),
                            // ),
                            onTap: () {
                              // Handle chat click
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
          navigatorKey.currentState!.pushReplacementNamed('/contact');
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
      ),
    );
  }
}
