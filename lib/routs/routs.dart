import 'package:bloc_test/features/home_data/domain/entities/post.dart';
import 'package:bloc_test/features/home_data/presentation/views/post_details_view.dart';
import 'package:bloc_test/features/home_data/presentation/views/post_view.dart';

import 'package:bloc_test/routs/app_routs.dart';
import 'package:go_router/go_router.dart';

final routs = GoRouter(routes: [
  GoRoute(path: AppRouts.initalView, builder: (context, state) => PostView()),
  GoRoute(
      path: AppRouts.postDetailsView,
      builder: (context, state) {
        final Post post = state.extra as Post;
        return PostDetailsView(
          post: post,
        );
      })
]);
