 import '../../model/massage_model.dart';

class ChatState {}
class ChatInitial extends ChatState {}
class ChatSucces extends ChatState {
  List<Massege> massegelist;
  ChatSucces({required this.massegelist});
}
