import 'package:flutter/material.dart';
import 'package:moufed_movies/Models/MovieModel.dart';


class Details extends StatelessWidget {

  final MovieModel model;


  Details({ required this.model});

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),

      body: Container(
        width: double.infinity,
        height:size.height * 0.5 ,
        child:Padding(
          padding: EdgeInsets.zero,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(
              flex: 3,
              child: Image.network(model.poster),


            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                flex: 1,
                child: Text(model.title),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                flex: 1,
                child: Text(model.year),
              ),
            ),
          ],

        ),
        )


      ),

    );
  }
}
