import 'package:flutter/material.dart';
import 'package:moufed_movies/Models/MovieModel.dart';

import 'Details.dart';



class MovieWidget extends StatelessWidget {
  final List<MovieModel> movies;


  MovieWidget({
    required this.movies
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, i) {
          final movie = movies[i];
          return ListTile(
              title: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: ClipRRect(
                      child: Image.network(movie.poster),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Flexible(
                      child:
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ 
                            Text(movie.title),
                            Text(movie.year)
                          ],
                        ),
                      )
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => Details(model: movie),
                    )

                );
              }
          );
        }
    );
  }
}
