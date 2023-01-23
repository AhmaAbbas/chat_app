
import 'package:chat_app/Cubit/login_cubit/Login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/snakbar.dart';

class Login_Cubit extends Cubit<Login_states>{
  Login_Cubit():super(LoginInitial());
  String? email;
  Future<void> log_in({required String emailuser,required String password_user}) async {
   emit(LoginLoading());
   try{
     var auth= FirebaseAuth.instance;
     var login_user= await auth.signInWithEmailAndPassword(email: emailuser!, password: password_user!);
     emit(LoginSuccsec());
   }on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found') {
       emit(LoginFailure(errormassege: "user-not-found"));
     } else if (e.code == 'wrong-password') {
       emit(LoginFailure(errormassege: "wrong-password"));
     }
       else{
       emit(LoginFailure(errormassege: "There was an error please try again"));
     }
  }
}
}