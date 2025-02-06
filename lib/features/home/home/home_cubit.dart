import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  signOut() async {
    emit(HomeLoading());
    await Supabase.instance.client.auth.signOut(scope: SignOutScope.global);
    // emit(HomeLogoutState());
  }
}
