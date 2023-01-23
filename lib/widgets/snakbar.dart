import 'package:flutter/material.dart';

void snackbar(BuildContext context,String value) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(value)),
  );
}
Widget customtext({required String data, required double size,required FontWeight fontWeight}){
  return Text(
    '$data',
    style: TextStyle(
      fontSize: size,
      fontWeight:fontWeight,
    ),
  );
}