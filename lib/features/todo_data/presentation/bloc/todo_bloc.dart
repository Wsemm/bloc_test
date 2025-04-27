import 'package:bloc/bloc.dart';
import 'package:bloc_test/features/todo_data/data/models/todo_model.dart';
import 'package:bloc_test/features/todo_data/domain/usercase/get_todos.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos getTodos;
  TodoBloc({required this.getTodos}) : super(TodoInitial()) {
    on<FetchTodoEvent>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await getTodos();
        emit(TodoLoaded(todos: todos));
      } catch (e) {
        emit(TodoError(error: e.toString()));
      }
    });

    on<TodoDetailsEvent>((TodoDetailsEvent evet, emit) {
      if (state is TodoLoaded) {
        emit(TodoDetails(todo: (state as TodoLoaded).todos[evet.index]));
      }
    });
  }
}
