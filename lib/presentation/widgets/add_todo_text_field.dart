import 'package:bloc_sample_todo_app/blocs/todos/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoTextField extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  AddTodoTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: const InputDecoration(
        label: Text(
          'What to do?',
        ),
      ),
      onSubmitted: (description) =>
          context.read<TodosBloc>().add(AddTodoEvent(description: description)),
    );
  }
}
