import 'package:bloc_test/features/home_data/domain/entities/post.dart';
import 'package:bloc_test/features/home_data/presentation/views/post_details_view.dart';
import 'package:bloc_test/features/home_data/presentation/views/post_view.dart';
import 'package:bloc_test/features/todo_data/presentation/views/todo_details_view.dart';
import 'package:bloc_test/features/todo_data/presentation/views/todo_view.dart';

import 'package:bloc_test/routs/app_routs.dart';
import 'package:go_router/go_router.dart';

final routs = GoRouter(routes: [
  GoRoute(path: AppRout.initalView, builder: (context, state) => PostView()),
  GoRoute(
      path: AppRout.postDetailsView,
      builder: (context, state) {
        final Post post = state.extra as Post;
        return PostDetailsView(
          post: post,
        );
      }),
  GoRoute(
      path: AppRout.todoView,
      builder: (context, state) {
        return TodoView();
      }),
  GoRoute(
      path: AppRout.todoDetails,
      builder: (context, state) {
        return TodoDetailsView();
      })
]);
