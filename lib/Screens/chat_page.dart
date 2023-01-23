import 'package:chat_app/consts/Consts.dart';
import 'package:flutter/material.dart';

import '../widgets/item.dart';
import '../widgets/snakbar.dart';

class Chat_Page extends StatelessWidget {
  static String id="/chatpage";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kprimarycolor,
        appBar: AppBar(
          title: customtext(data: 'Chat Page',size: 25,fontWeight: FontWeight.normal),
          actions: [
            IconButton(icon: Icon(Icons.search),onPressed: (){},),
          ],
        ),
        body: ListView(
          children: [
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
          ],
        )
      ),
    );
  }
}
