import 'package:bloc_test/features/home_data/domain/usecases/get_post.dart';
import 'package:bloc_test/features/home_data/presentation/bloc/post_event.dart';
import 'package:bloc_test/features/home_data/presentation/bloc/post_state.dart';
import 'package:bloc_test/routs/app_routs.dart';
import 'package:bloc_test/routs/routs.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;

  PostBloc({required this.getPosts}) : super(PostInitial()) {
    on<GetPostsEvent>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await getPosts();
        emit(PostLoaded(
          posts: posts,
        ));
      } catch (e) {
        emit(PostError(
          message: e.toString(),
        ));
      }
    });

    on<DetailsPostEvent>((DetailsPostEvent event, emit) {
      showBottomSheet(
        context: event.context,
        builder: (context) => Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height / 2,
          child: Text("dsa"),
        ),
      );
      // routs.push(AppRouts.testData, extra: event.post);
      // showBottomSheet(
      //   context: context,
      //   builder: (context) => Container(
      //     child: Text("dsa"),
      //   ),
      // );
    });
  }
}
