import 'package:chat_app/Cubit/register_cubit/register_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register_Cubit extends Cubit<Register_States>{
  Register_Cubit():super(RegsiterInitial());
  Future<void> authnitication({required String email,required String password}) async {
    try{
      emit(RegsiterLoading());
      var auth = FirebaseAuth.instance;
      UserCredential user =
      await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      emit(RegsiterSucces());
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegsiterFailure(errormassege: "weak-password"));
      } else if (e.code == 'email-already-in-use') {
        emit(RegsiterFailure(errormassege: "email-already-in-use"));
      }
      else
      {
        emit(RegsiterFailure(errormassege: "There was an error please try again"));
      }
      }
  }

}