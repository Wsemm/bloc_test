// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class FetchTodoEvent extends TodoEvent {}

class TodoDetailsEvent extends TodoEvent {
  final int index;
  TodoDetailsEvent({
    required this.index,
  });
  List<Object> get props => [];
}
