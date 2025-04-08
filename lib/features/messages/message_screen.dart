import 'package:chat_app/features/conversation/conversation_model.dart';
import 'package:chat_app/features/conversation/cubit/conversation_cubit.dart';
import 'package:chat_app/features/messages/message_cubit/message_cubit.dart';
import 'package:chat_app/utils/meth_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key, required this.chatId, required this.myId});
  final int chatId;
  final String myId;
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MessageCubit>().getAllMessages(widget.chatId);
  }

  final TextEditingController _msessagecontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
            onPressed: () {
              context.read<MessageCubit>().getAllMessages(widget.chatId);
            },
            child: Text("Refresh")),
      ),
      body: Column(
        children: [
          Expanded(
            child:
                BlocBuilder<MessageCubit, MessageState>(builder: (context, s) {
              switch (s.runtimeType) {
                case MessageLoading:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case MessageSuccess:
                  return ListView.builder(
                      itemCount: (s as MessageSuccess).messages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: (s as MessageSuccess)
                                        .messages[index]
                                        .senderId ==
                                    widget.myId
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: context.width / 1.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (s as MessageSuccess)
                                                .messages[index]
                                                .senderId ==
                                            widget.myId
                                        ? const Color.fromARGB(
                                            255, 154, 223, 255)
                                        : Colors.blueAccent),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (s as MessageSuccess)
                                            .messages[index]
                                            .content,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              TimeOfDay.fromDateTime(
                                                (s as MessageSuccess)
                                                    .messages[index]
                                                    .createdAt,
                                              ).format(context),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                case MessageFailure:
                  return Center(
                    child: Text((s as MessageFailure).errorMessage),
                  );
                default:
                  return Center(
                    child: Text('Something went wrong'),
                  );
              }
              // return state is MessageLoading
            }),
          ),
          Container(
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
                    context.read<ConversationCubit>().sendMessage(
                          createConversationModel(
                              senderId: '',
                              chatId: widget.chatId,
                              contentType: "1",
                              content: _msessagecontroler.text),
                        );
                    _msessagecontroler.clear();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
