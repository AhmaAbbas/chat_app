import 'package:flutter/material.dart';

class Custom_Textformfeild extends StatelessWidget {
  Custom_Textformfeild({this.label_text,this.icon,this.onchaged,this.obsecure=false});
  String? label_text;
  IconData? icon;
  Function(String)? onchaged;
  bool? obsecure;
  //Function(String)? validate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText:obsecure! ,
        validator: (value){
          if(value!.isEmpty)
          {
            return 'this feild is required';
          }
        },
        onChanged: onchaged,
        decoration: InputDecoration(
          labelText: label_text,
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)
            ),
            prefixIcon: Icon(icon,
              color: Colors.white,),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)
            )
        ),
      ),
    );
  }
}
