import 'package:bloc/bloc.dart';
import 'package:chat_app/features/contact_user/cmodel.dart';
import 'package:chat_app/utils/const_Strings.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'contact_user_event.dart';
part 'contact_user_state.dart';

class ContactUserBloc extends Bloc<ContactUserEvent, ContactUserState> {
  final SupabaseClient supabaseClient;

  ContactUserBloc(this.supabaseClient) : super(ContactUserInitial()) {
    on<FetchUserEvent>(_onFetchUsers);
  }
  Future<void> fetchUsers() async {
    try {
      final loggedInUserId = supabaseClient.auth.currentUser?.id;
      final response = await supabaseClient
          .from('user')
          .select()
          .neq(C.t_user_id, loggedInUserId ?? "");
      if (response.isNotEmpty) {
        final users = response.map((u) => MyUser.fromJson(u)).toList();
        emit(ContactUserLoaded(users));
      }
    } catch (e) {
      emit(ContactUserError(e.toString()));
    }
  }

  Future<void> _onFetchUsers(
      ContactUserEvent event, Emitter<ContactUserState> emit) async {
    if (event is FetchUserEvent) {
      emit(ContactUserLoading());
      fetchUsers();
    }
  }
}
