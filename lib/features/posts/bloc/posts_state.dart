part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}
abstract class PostActionState extends PostsState{}
class PostsInitial extends PostsState {}
class PostFetchingLoadingState extends PostsState{}
class PostFetchingSuccesfulState extends PostsState{
  final List<PostDataUiModel> posts;

  PostFetchingSuccesfulState({required this.posts});
}
class PostAdditionSuccessState extends PostActionState{} 
class PostAdditonErrorState extends PostActionState{} 
