import 'package:bloc_sample_todo_app/blocs/active_todos_count/active_todos_count_bloc.dart';
import 'package:bloc_sample_todo_app/blocs/todos/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text(
          'TODO',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        BlocListener<TodosBloc, TodosState>(
          listener: (context, state) {
            context
                .read<ActiveTodosCountBloc>()
                .add(CalculateActiveTodosCountEvent(todos: state.todos));
          },
          child: BlocBuilder<ActiveTodosCountBloc, ActiveTodosCountState>(
            builder: (context, state) {
              return Text(
                '${state.activeTodoCount} items left',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
