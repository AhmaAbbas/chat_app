import 'package:bloc/bloc.dart';
import 'package:chat_app/model/massage_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../consts/Consts.dart';
import 'chat_state.dart';


class ChatBloc extends Cubit<ChatState> {
  ChatBloc() : super(ChatInitial());
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  List<Massege> massegelist=[];
  void addmassege({required String massege, required String email}){
     try{
       users = FirebaseFirestore.instance.collection('users');
       users.add({
         kmassege:massege,
         kcreatedat:DateTime.now(),
         'id':email,
       });
     }catch(error){
       print("error");
     }
  }
  void getmassege(){
    users.orderBy(kcreatedat,descending: true).snapshots().listen((event) {
      for(var doc in event.docs){
        print(doc);
        massegelist.add(Massege.fromjson(jsondata: doc));
      }
      emit(ChatSucces(massegelist: massegelist));
    });
  }
}
