import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valid_auth_bloc/bloc/auth_bloc.dart';
import 'package:valid_auth_bloc/repo/auth_repository.dart';
import 'package:valid_auth_bloc/screens/sign_up_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return RepositoryProvider(
      create: (context)=>AuthRepository(),
      child: BlocProvider(
        create: (context)=> AuthenticationBloc(authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: MaterialApp(
            home: SignUpPage()
        ),
      ),
    );
  }}



