import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valid_auth_bloc/screens/home.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_events.dart';
import '../bloc/auth_states.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
    BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up Page")),
      body: Column(
        children: [
          BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
                  if(state is AuthenticationSuccess){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                  }
              },
              builder: (context, state) {
                String passwordError = '';
                String emailError = '';
                if (state is AuthenticationFailure) {
                  passwordError = state.passwordError;
                  emailError = state.emailError;
                }
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            errorText: emailError
                        ),

                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                          errorText: passwordError,


                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          authenticationBloc.add(SignUpButtonPressed(
                            email: emailController.text,
                            password: passwordController.text,
                          ));

                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
              );
            }, // <--- Add this closing parenthesis
          ),
        ],
      ),
    );
  }
}
