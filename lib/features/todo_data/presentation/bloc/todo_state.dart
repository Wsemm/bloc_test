part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

final class TodoLoaded extends TodoState {
  const TodoLoaded({required this.todos});
  final List<TodoModel> todos;
  List<Object> get props => [this.todos];
}

final class TodoError extends TodoState {
  const TodoError({required this.error});
  final String error;
  List<Object> get props => [this.error];
}

final class TodoDetails extends TodoState {
  const TodoDetails({required this.todo});
  final TodoModel todo;
  List<Object> get props => [];
}
