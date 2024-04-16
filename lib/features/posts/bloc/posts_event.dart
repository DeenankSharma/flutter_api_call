part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class PostsInitailFetchEvent extends PostsEvent{}

class  PostAddEvent extends PostsEvent{}
