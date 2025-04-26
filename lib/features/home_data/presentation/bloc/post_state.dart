// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:bloc_test/features/home_data/domain/entities/post.dart';

abstract class PostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded({required this.posts});
  @override
  List<Object> get props => [this.posts];
}

class PostDetails extends PostState {
  final Post post;
  PostDetails({required this.post});
  @override
  List<Object> get props => [this.post];
}

class PostError extends PostState {
  final String message;
  PostError({
    required this.message,
  });
}
