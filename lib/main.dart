import 'package:chat_app/Cubit/chat_cubit/chat_bloc.dart';
import 'package:chat_app/Cubit/login_cubit/login_cubit.dart';
import 'package:chat_app/Cubit/register_cubit/register_cubit.dart';
import 'package:chat_app/Screens/chat.dart';
import 'package:chat_app/Screens/chat_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/Login.dart';
import 'Screens/register_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Chat_App());
}

class Chat_App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>Login_Cubit(),),
        BlocProvider(create: (context)=>Register_Cubit(),),
        BlocProvider(create: (context)=>ChatBloc()),
      ],
      child: MaterialApp(
        routes: {
          '/':(context)=> Log_in(),
          Register_Page.id:(context)=> Register_Page(),
          Chat_Page.id:(context)=>Chat_Page(),
          Chat.id:(context)=>Chat(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute:'/',
      ),
    );
  }
}




