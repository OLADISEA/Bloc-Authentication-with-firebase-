import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository{
  final auth = FirebaseAuth.instance;
  Future signUp({required String email, required String password}) async{
    try{
      UserCredential result = await auth.createUserWithEmailAndPassword(email:email,password:password);
      return result.user;
    }catch(e){
      print(e.toString());
    }
  }


  Future signIn({required String email,required String password})async{
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user!;

    }catch(e){
      print(e.toString());

    }
  }
}