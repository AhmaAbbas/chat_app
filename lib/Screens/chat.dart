
import 'package:chat_app/Cubit/chat_cubit/chat_bloc.dart';
import 'package:chat_app/consts/Consts.dart';
import 'package:chat_app/model/massage_model.dart';
import 'package:chat_app/widgets/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/chat_cubit/chat_state.dart';
import '../Cubit/login_cubit/login_cubit.dart';
import '../widgets/chat_puble.dart';

class Chat extends StatelessWidget {
  static String id='/Chat';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController chat_controller=TextEditingController();
  final controller =ScrollController();
  List<Massege> massegeslist=[];
  @override
  Widget build(BuildContext context) {
    String? email= BlocProvider.of<Login_Cubit>(context).email;
    //var email=ModalRoute.of(context)!.settings.arguments;
    var bloc=BlocProvider.of<ChatBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kprimarycolor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('$klogo'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customtext(data: 'Chat', size:20 , fontWeight: FontWeight.bold),
              ),

            ],
          ),
          centerTitle: true,
        ),
        body:Column(children: [
          Expanded(
              child: BlocConsumer<ChatBloc,ChatState>(
                listener: (context,state){
                  if(state is ChatSucces){
                    massegeslist=state.massegelist;
                  }
                },
                builder:(context,state){
                  return ListView.builder(
                      reverse: true,
                      controller: controller,
                      itemCount: massegeslist.length,
                      itemBuilder: (context,index){
                        return massegeslist[index].id==email ?chatbuble(massege: massegeslist[index]) :chatbuble2(massege: massegeslist[index]);
                      });
                },

              )
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller:chat_controller ,
              onSubmitted: (data){
                print("email $email");
                bloc.addmassege(massege: data, email: email!);
                chat_controller.clear();
                controller.animateTo(
                    0,
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn);
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(icon: Icon(Icons.send),onPressed: (){},),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: kprimarycolor
                      )
                  )
              ),
            ),
          )
        ],),
      ),
    );
  }


}
