import 'package:api_call_project/features/home.dart';
import 'package:api_call_project/features/posts/ui/posts_page.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:PostsPage(),
    );
  }
}