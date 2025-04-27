// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_test/features/todo_data/data/models/todo_model.dart';
import 'package:bloc_test/features/todo_data/data/repositories/todo_repository.dart';

class GetTodos {
  final TodoRepository repository;
  GetTodos(
    this.repository,
  );

  Future<List<TodoModel>> call() async {
    return await repository.getTodos();
  }
}
