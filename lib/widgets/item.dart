import 'package:chat_app/widgets/snakbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/images/Ahmed.jpg"),
          ),
          Container(
            width: 120,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customtext(
                  size: 15,
                  data: "Ahmed Abbas",
                  fontWeight: FontWeight.bold
                ),
                customtext(
                    size: 15,
                    data: "I 'm Okay",
                  fontWeight: FontWeight.normal,
                )
              ],
            ),
          ),
          Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customtext(data: '10:23 PM', size: 15, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
