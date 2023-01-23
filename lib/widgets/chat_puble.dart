import 'package:flutter/material.dart';

import '../consts/Consts.dart';
import '../model/massage_model.dart';

Align chatbuble({required Massege massege}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: EdgeInsets.only(left: 10,top: 32,bottom: 32,right: 16),
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
          color: kprimarycolor,
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(25),
            topRight:Radius.circular(25),
            bottomRight:Radius.circular(25),
          )
      ),
      child: Text('${massege.massege.toString()}',style: TextStyle(fontSize: 15,color: Colors.white,),),
    ),
  );
}
Align chatbuble2({required Massege massege}) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      padding: EdgeInsets.only(left: 10,top: 32,bottom: 32,right: 16),
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(25),
            topRight:Radius.circular(25),
            bottomLeft:Radius.circular(25),
          )
      ),
      child: Text('${massege.massege.toString()}',style: TextStyle(fontSize: 15,color: Colors.white,),),
    ),
  );
}