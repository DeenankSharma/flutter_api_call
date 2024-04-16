import 'dart:convert';

import 'package:api_call_project/features/posts/bloc/posts_bloc.dart';
import 'package:api_call_project/features/posts/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo{
  static Future<List<PostDataUiModel>> fetchPosts () async{
    var client = http.Client();
    List<PostDataUiModel>posts=[];
try {
  var response = await client.get(
      
      Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      List result = jsonDecode(response.body);
      for(int i = 0;i<result.length;i++){
        PostDataUiModel post = PostDataUiModel.fromJson(result[i] as Map<String,dynamic>);
        posts.add(post);
      }
      return posts;
      // body: {'name': 'doodle', 'color': 'blue'});
  // var d?wait client.get(uri));
  // print(response.body);


} 
catch(e){
  print(e.toString());
  return [];
}
  }

  static Future<bool> addPost()async{
    var client = http.Client();
    var response = await client.post(
      
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: {'title': 'I am flutter student', 'body': 'i like appdev','userID':"34" }
      );
      if(response.statusCode>=200 && response.statusCode<300){
        return true;
      }
      else{
        return false;
      }
} 
  }
