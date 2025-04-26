// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_test/features/home_data/domain/entities/post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class GetPostsEvent extends PostEvent {}

class DetailsPostEvent extends PostEvent {
  final Post post;
  final BuildContext context;
  const DetailsPostEvent(
    this.context, {
    required this.post,
  });
}
