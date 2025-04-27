// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_test/features/home_data/data/models/posts_mode.dart';
import 'package:bloc_test/features/todo_data/data/dataSource/todo_remote_data_source.dart';
import 'package:bloc_test/features/todo_data/data/models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getTodos();
}

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource todoRemoteDataSource;
  TodoRepositoryImpl({
    required this.todoRemoteDataSource,
  });
  @override
  Future<List<TodoModel>> getTodos() async {
    return todoRemoteDataSource.getTodos();
  }
}
