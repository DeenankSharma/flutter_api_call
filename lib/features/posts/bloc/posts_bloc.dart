import 'dart:async';
import 'dart:convert';

import 'package:api_call_project/features/posts/models/post_data_ui_model.dart';
import 'package:api_call_project/features/posts/repos/posts_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitailFetchEvent>(postsInitailFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postsInitailFetchEvent(PostsInitailFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostFetchingLoadingState());
    List<PostDataUiModel> posts  = await PostsRepo.fetchPosts();
    emit(PostFetchingSuccesfulState(posts: posts));
  }

  FutureOr<void> postAddEvent(PostAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostsRepo.addPost();
    if(success){
      emit(PostAdditionSuccessState());
    }
    else{
      emit(PostAdditonErrorState());
    }
  }
}
