part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {
  ///
}

class HomeLogoutState extends HomeState {}

final class HomeLoading extends HomeState {}
