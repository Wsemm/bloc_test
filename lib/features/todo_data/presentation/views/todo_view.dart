import 'package:bloc_test/core/di/service_locator.dart';
import 'package:bloc_test/features/todo_data/presentation/bloc/todo_bloc.dart';
import 'package:bloc_test/routs/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<TodoBloc>(),
      child: Scaffold(
        body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          final todoBloc = context.read<TodoBloc>();
          if (state is TodoInitial) {
            return Center(
              child: ElevatedButton(
                  onPressed: () => todoBloc.add(FetchTodoEvent()),
                  child: Text("Get Todos")),
            );
          }
          if (state is TodoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                final todo = state.todos[index];
                return Card(
                  child: Column(
                    children: [
                      Center(
                        child: Text(todo.id.toString()),
                      ),
                      ListTile(
                        title: Text(todo.title!),
                        subtitle: Text(todo.userId.toString()),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            todoBloc.add(TodoDetailsEvent(index: index));
                            context.push(AppRout.todoDetails);
                          },
                          child: Text("Details"))
                    ],
                  ),
                );
              },
            );
          } else if (state is TodoError) {
            return Text(state.error);
          } else {
            return SizedBox();
          }
        }),
        appBar: AppBar(
          backgroundColor: Colors.cyan.withValues(alpha: 0.3),
          title: Text("My Todo"),
        ),
      ),
    );
  }
}
