import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  Custom_Button({required this.data,this.ontap});
  String? data;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ontap ,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          height: 55,
          width: double.infinity,
          child: Center(child: Text("$data",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Color(0xff2B475E)),)),
        ),
      ),
    );
  }
}
