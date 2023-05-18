part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginInput extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;

  LoginInput(this.email, this.password, this.context);
}
