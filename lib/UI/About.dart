// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class About extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return Scaffold(


      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        height: size.height *0.7 ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FittedBox(
              child: Text('Eng. Moufed Dibou',
              style: TextStyle(
               color: Colors.blue,
               fontWeight: FontWeight.bold ,
                fontSize: 20
              ),
              ),

            ),
            FittedBox(
              child: Text('Mobile Apps developer',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),

            ),
            FittedBox(
              child: Text('Email : moffeddebo2gmail.com',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),

            ),
            FittedBox(
              child: Text('MobilePhone : +963 992231033',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),

            )
          ],
        ),
      ),
      );

  }
}
