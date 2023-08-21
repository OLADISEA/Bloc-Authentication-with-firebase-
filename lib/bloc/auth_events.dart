import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpButtonPressed extends AuthenticationEvent {
  final String email;
  final String password;

  SignUpButtonPressed({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
class LoginButtonPressed extends AuthenticationEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}


