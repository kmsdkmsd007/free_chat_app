part of 'splash_cubit_cubit.dart';

// sealed can only be used in this file , this is like abstract class.
sealed class SplashCubitState extends Equatable {
  const SplashCubitState();

  @override
  List<Object> get props => [];
}

// showing welcome screen for 3 seconds
final class SplashCubitInitial extends SplashCubitState {}
