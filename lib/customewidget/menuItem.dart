import 'dart:ui';

import 'package:flutter/material.dart';

class CustomeMenu extends StatelessWidget {
  Image img;
  Color color;
  String title;
  CustomeMenu({this.img, this.color, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: img,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: new TextStyle(
              fontFamily: "Asap",
              color: Color.fromRGBO(163, 165, 166, 1),
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
