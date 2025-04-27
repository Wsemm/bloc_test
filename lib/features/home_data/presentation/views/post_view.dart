import 'package:bloc_test/features/home_data/presentation/bloc/post_event.dart';
import 'package:bloc_test/features/home_data/presentation/bloc/post_state.dart';
import 'package:bloc_test/routs/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/post_bloc.dart';
import '../../../../core/di/service_locator.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<PostBloc>()..add(GetPostsEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text('Posts')),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            var postBloc = context.read<PostBloc>();
            if (state is PostLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (state is PostLoaded) {
                return RefreshIndicator(
                  onRefresh: () async => postBloc..add(GetPostsEvent()),
                  child: ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          index == 0
                              ? ElevatedButton(
                                  onPressed: () =>
                                      context.push(AppRout.todoView),
                                  child: Text("go to Todo"))
                              : SizedBox(),
                          ListTile(
                            title: Text(state.posts[index].title),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.push(AppRout.postDetailsView,
                                  extra: state.posts[index]);
                            },
                            child: const Text("View Details"),
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return state is PostError ? Text(state.message) : SizedBox();
              }
            }
          },
        ),
      ),
    );
  }
}
