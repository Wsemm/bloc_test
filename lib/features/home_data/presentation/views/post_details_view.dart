import 'package:bloc_test/common/utils/my_extensions.dart';
import 'package:bloc_test/core/di/service_locator.dart';
import 'package:bloc_test/features/home_data/domain/entities/post.dart';
import 'package:bloc_test/features/home_data/presentation/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailsView extends StatelessWidget {
  final Post post;
  const PostDetailsView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<PostBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(1.h(context)),
                child: Card(
                  child: ListTile(
                    title: Text(
                      post.title,
                    ),
                    subtitle: Text(
                      post.id.toString(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Post Details"),
        ),
      ),
    );
  }
}
