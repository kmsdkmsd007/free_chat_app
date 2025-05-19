import 'package:bloc/bloc.dart';
import 'package:chat_app/features/messages/message_model.dart';
import 'package:chat_app/utils/const_Strings.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  getAllMessages(int chatId) async {
    emit(MessageLoading());
    try {
      final List<Map<String, dynamic>> userChats = await Supabase
          .instance.client
          .from(C.t_messages)
          .select()
          .eq('chat_id', chatId)
          .order('created_at', ascending: true);

      List<MessageModel> chatModels =
          userChats.map((e) => e.toMessageModel()).toList();
      emit(MessageSuccess(messages: chatModels));
    } catch (e) {
      print('Error in getAllChats: ${e.toString()}');
      emit(MessageFailure(errorMessage: e.toString()));
    }
  }
}
