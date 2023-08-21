import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}


class AuthenticationFailure extends AuthenticationState {
  final String passwordError;
  final String emailError;


  AuthenticationFailure({required this.passwordError,required this.emailError});

  @override
  List<Object?> get props => [passwordError,emailError];
}
