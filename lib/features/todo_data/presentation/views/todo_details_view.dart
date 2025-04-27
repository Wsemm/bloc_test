import 'package:bloc_test/core/di/service_locator.dart';
import 'package:bloc_test/features/todo_data/presentation/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoDetailsView extends StatelessWidget {
  const TodoDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<TodoBloc>(context),
      // create: (context) => locator<TodoBloc>(),
      child: Scaffold(
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            final detailsBloc = context.read<TodoBloc>();
            if (state is TodoInitial) {
              return ElevatedButton(
                  onPressed: () => detailsBloc..add(TodoDetailsEvent(index: 0)),
                  child: Text("get details"));
            }
            if (state is TodoDetails) {
              return Text(state.todo.title!);
            } else {
              return Text("${state.runtimeType}");
            }
          },
        ),
      ),
    );
  }
}
