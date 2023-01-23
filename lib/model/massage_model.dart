import 'package:cloud_firestore/cloud_firestore.dart';

class Massege{
  String? massege;
  String? id;
  Massege({this.massege,this.id});
  factory Massege.fromjson({required   jsondata}){
    return Massege(massege: jsondata['masseges'],id: jsondata['id']);
  }
}