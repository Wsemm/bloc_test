// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_test/core/network/dio_client.dart';
import 'package:bloc_test/features/todo_data/data/models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodos();
}

class TodoRemoteDataSourceImp implements TodoRemoteDataSource {
  final DioClient dio;
  TodoRemoteDataSourceImp({
    required this.dio,
  });
  @override
  Future<List<TodoModel>> getTodos() async {
    final response =
        await dio.get("https://jsonplaceholder.typicode.com/todos");
    List<TodoModel> todos = (response.data as List)
        .map((json) => TodoModel.fromJson(json))
        .toList();
    return todos;
  }
}
