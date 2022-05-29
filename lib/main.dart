import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moufed_movies/Models/MovieModel.dart';
import 'package:moufed_movies/UI/MovieWidget.dart';

import 'UI/About.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 late List <MovieModel>  _movies;
 int selectionScreen=0;

  @override
  void initState(){
    super.initState();
    _allMovies();


  }

  void _allMovies() async{
  final movies= await _getMovies();
  setState(() {
    _movies=movies;
  });

  }
  
  Future <List<MovieModel>> _getMovies() async{
    var response= await http.get(Uri.parse('http://www.omdbapi.com/?s=Batman&page=2&apikey=f01818a8'));

    if(response.statusCode == 200){
      var json= jsonDecode(response.body);
      Iterable list= json['Search'];
       return list.map((movie) => MovieModel.fromJson(movie)).toList();
    }
    else{
  throw Exception('Failed To load movies');

    }
    
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Flutter Demo',

      home: Scaffold(
        appBar:AppBar(
          title: Text('Movies'),
        ),
        body: _getScreen(selectionScreen),
       drawer: Drawer(
         child: ListView(
           scrollDirection: Axis.vertical,
           children: [
             DrawerHeader(
               padding: EdgeInsets.zero,
                 child: Container(
                 color:Colors.lightBlue
             )
             ),

             ListTile(
               // ignore: prefer_const_constructors
               title: Text('About'),
               // ignore: prefer_const_constructors
               leading: Icon(Icons.info_outlined),
               onTap: (){

                 setState(() {
                   selectionScreen=1;
                 });
                 Navigator.pushNamed(context, '/about');
                 },
             ),
             ListTile(
               // ignore: prefer_const_constructors
               title: Text('Contact us'),
               // ignore: prefer_const_constructors
               leading: Icon(Icons.phone),
               onTap: (){
                 

               },
             ),
             // ignore: prefer_const_constructors
             Divider(
               color: Colors.black,
             ),
             ListTile(
               // ignore: prefer_const_constructors
               title: Text('Home'),
               // ignore: prefer_const_constructors
               leading: Icon(Icons.report_gmailerrorred_outlined),
               // ignore: prefer_const_constructors
               trailing: Icon(Icons.arrow_forward_ios),
               onTap: (){

                 setState(() {
                   selectionScreen=0;
                 });
                 Navigator.pushNamed(context, '/home');
               },
             ),



           ],
         ),
       ),
      ),
      routes:{
        '/about' : (c) => About(),
        '/home' : (c) => MovieWidget(movies:_movies)
      }
    );
  }
  
  _getScreen(int select){
    switch(select) {
      
      case 0:
        return MovieWidget(movies:_movies);
        
      case 1:
        return About();
      default:
    }
    
    
  }
}




