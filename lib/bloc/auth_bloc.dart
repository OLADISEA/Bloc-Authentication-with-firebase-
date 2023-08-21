import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/auth_repository.dart';
import 'auth_events.dart';
import 'auth_states.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  AuthenticationBloc({required this.authRepository}) : super(AuthenticationInitial()) {
    on<SignUpButtonPressed>((event, emit) async {
      if (isValidEmail(event.email) && event.password.length >= 6) {
        try {
          dynamic result = await authRepository.signUp(email: event.email, password: event.password);
          if(result != null){
            emit(AuthenticationSuccess());
          }
          print('An error occurred during sign up');

        } catch (e) {
          emit(AuthenticationFailure(
            emailError: '',
            passwordError: '',
          ));
          print('An error occurred during sign-up');
        }
      } else {
        emit(AuthenticationFailure(
          emailError: isValidEmail(event.email) ? '' : 'Invalid Email',
          passwordError: event.password.length >= 6 ? '' : 'Password must be at least 6 chars',
        ));
      }
    });



    on<LoginButtonPressed>((event, emit) async {
      if (isValidEmail(event.email) && event.password.length >= 6) {
        try {
          dynamic result = await authRepository.signIn(email: event.email, password: event.password);
          if(result != null){
            emit(AuthenticationSuccess());
          }
          print('An error occurred during sign up');

        } catch (e) {
          emit(AuthenticationFailure(
            emailError: '',
            passwordError: '',
          ));
          print('An error occurred during sign-up');
        }
      } else {
        emit(AuthenticationFailure(
          emailError: isValidEmail(event.email) ? '' : 'Invalid Email',
          passwordError: event.password.length >= 6 ? '' : 'Password must be at least 6 chars',
        ));
      }
    });


  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}