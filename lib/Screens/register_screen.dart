import 'package:chat_app/Cubit/register_cubit/register_cubit.dart';
import 'package:chat_app/Cubit/register_cubit/register_states.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../consts/Consts.dart';
import '../widgets/custombutton.dart';
import '../widgets/customtextformfeild.dart';
import '../widgets/snakbar.dart';
import 'chat.dart';

class Register_Page extends StatelessWidget {
  static String id = '/RegisterPage';
  String? email;
  bool is_loaded=false;
  String? password;
  final GlobalKey<FormState> formkey =GlobalKey();
  @override
  Widget build(BuildContext context) {
    var bloc=BlocProvider.of<Register_Cubit>(context);
    return BlocConsumer<Register_Cubit,Register_States>(
        listener: (context,state){
          if(state is RegsiterLoading)
          {
            is_loaded =true;
          }
          else if(state is RegsiterSucces ){
            is_loaded =false;
            Navigator.pushNamed(context,Chat.id);
          }
          else if(state is RegsiterFailure ){
            is_loaded =false;
            snackbar(context,state.errormassege);
          }
        },
      builder: (context,states){
          return SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: is_loaded,
              child: Scaffold(
                backgroundColor: kprimarycolor,
                body: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 8),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/images/scholar.png"),
                        ),
                        Text(
                          "Scolar Chat",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white,
                              fontFamily: 'Pacifico'),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Text(
                                textAlign: TextAlign.left,
                                "Register ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Custom_Textformfeild(
                          onchaged: (String value) {
                            email = value;
                          },
                          label_text: "enter email",
                          icon: Icons.email,
                        ),
                        Custom_Textformfeild(
                          onchaged: (String data) {
                            password = data;
                          },
                          label_text: "enter password",
                          icon: Icons.lock_open_outlined,
                        ),
                        Custom_Button(
                            ontap: () async {
                              if(formkey!.currentState!.validate())
                              {
                                bloc.authnitication(email: email!,password: password!);
                              }
                            },
                            data: "Register"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "already  have an account ",
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Log in",
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Spacer(
                          flex: 3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
      },
    );
  }



  // Future<void> authnitication() async {
  //   var auth = FirebaseAuth.instance;
  //   UserCredential user =
  //       await auth.createUserWithEmailAndPassword(
  //           email: email!, password: password!);
  // }
}
