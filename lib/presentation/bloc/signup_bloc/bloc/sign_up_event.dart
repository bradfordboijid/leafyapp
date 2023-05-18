part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpInput extends SignUpEvent {
  final String firstName;
  final String email;
  final String password;
  final String avatar;
  final BuildContext context;

  SignUpInput(
    this.firstName,
    this.email,
    this.password,
    this.avatar,
    this.context,
  );
}
