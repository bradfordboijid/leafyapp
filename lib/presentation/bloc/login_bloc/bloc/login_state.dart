part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final String email;
  final String password;

  LoginLoaded(this.email, this.password);
}

class LoginError extends LoginState {}
