import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_cubit_state.dart';

class SplashCubitCubit extends Cubit<SplashCubitState> {
  SplashCubitCubit() : super(SplashCubitInitial());

  moveToNextScreen() {}
}
