import 'package:api_call_project/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}


class _PostsPageState extends State<PostsPage> {
  final PostsBloc postsBloc = PostsBloc();
  @override
  void initState(){
    postsBloc.add(PostsInitailFetchEvent());
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts Page'),
      ),
      floatingActionButton: FloatingActionButton(child:Icon(Icons.add),onPressed: (){
        postsBloc.add(PostAddEvent());
      },),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listenWhen:(previous, current) => current is PostActionState ,
        buildWhen:(previous,current)=> current is !PostActionState ,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType){
            case PostFetchingLoadingState:
            return const Center(child: CircularProgressIndicator(),);
            case PostFetchingSuccesfulState:
            final successState = state as PostFetchingSuccesfulState;
            return Container(
            child: ListView.builder(itemCount:successState.posts.length ,
            itemBuilder: (context,index){
              return Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(successState.posts[index].title),
                  Text(successState.posts[index].body)
                ],),
              );
            }),
            );
            default:
            return const SizedBox();
          }
          
        },
      ),
    );
  }
}