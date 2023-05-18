part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {
  final String firstName;
  final String email;
  final String password;
  final String avatar;

  SignUpLoaded(this.email, this.password, this.firstName, this.avatar);
}

class SignUpError extends SignUpState {}
