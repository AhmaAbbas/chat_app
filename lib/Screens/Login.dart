import 'package:chat_app/Cubit/login_cubit/Login_states.dart';
import 'package:chat_app/Screens/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Cubit/chat_cubit/chat_bloc.dart';
import '../Cubit/login_cubit/login_cubit.dart';
import '../consts/Consts.dart';
import '../widgets/custombutton.dart';
import '../widgets/customtextformfeild.dart';
import '../widgets/snakbar.dart';
import 'chat.dart';
import 'register_screen.dart';

class Log_in extends StatelessWidget {

  String? emailuser;
  bool is_loaded=false;
  String? password_user;

  GlobalKey<FormState> formkey =GlobalKey();

  @override
  Widget build(BuildContext context) {
    var bloc=BlocProvider.of<Login_Cubit>(context);
    return BlocConsumer<Login_Cubit, Login_states>(
  listener: (context, state) {
    if(state is LoginLoading)
      {
        is_loaded =true;
      }
    else if(state is LoginSuccsec ){
      is_loaded =false;
      BlocProvider.of<Login_Cubit>(context).email=emailuser;
      BlocProvider.of<ChatBloc>(context).massegelist;
      Navigator.pushNamed(context,Chat.id);
    }
    else if(state is LoginFailure ){
      is_loaded =false;
      snackbar(context,state.errormassege);
    }
  },
  builder:(context,state)=>ModalProgressHUD(
    inAsyncCall: is_loaded,
    child: SafeArea(
        child: Form(
          key: formkey,
          child: Scaffold(
            backgroundColor: kprimarycolor,
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 25,horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 2,),
                  CircleAvatar (
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/scholar.png"),
                  ),
                  Text("Scolar Chat",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white,fontFamily: 'Pacifico'),),
                  Spacer(flex: 2,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          textAlign: TextAlign.left,
                          "Log in ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                      ],
                    ),
                  ),
                  Custom_Textformfeild(
                    onchaged: (value){
                      emailuser=value;
                    },
                    label_text: "enter email",icon: Icons.email,),
                  Custom_Textformfeild(
                    obsecure: true,
                    onchaged: (value){
                      password_user=value;
                    },
                    label_text: "enter password",icon: Icons.lock_open_outlined,),
                  Custom_Button(
                    ontap: ()async{
                      if(formkey!.currentState!.validate())
                      {
                        bloc.log_in(emailuser: emailuser!, password_user: password_user!);
                     }
                    },
                      data: "Sign in"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("don't have an account ",style: TextStyle(fontSize: 15,color: Colors.white),),
                    TextButton(onPressed: ()async{
                      Navigator.pushNamed(context,Register_Page.id);
                    }, child: Text("Register",style: TextStyle(fontSize: 15,color: Colors.white),),)
                  ],),
                  Spacer(flex: 3,)
                ],
              ),
            ),
          ),
        ),
      ),
  ),
);
  }

  Future<void> log_in() async {
    var auth= FirebaseAuth.instance;
    var login_user= await auth.signInWithEmailAndPassword(email: emailuser!, password: password_user!);
  }
}
