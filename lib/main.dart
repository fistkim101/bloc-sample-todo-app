import 'package:bloc_sample_todo_app/blocs/active_todos_count/active_todos_count_bloc.dart';
import 'package:bloc_sample_todo_app/blocs/filtered_todos/filtered_todos_bloc.dart';
import 'package:bloc_sample_todo_app/blocs/search_term/search_term_bloc.dart';
import 'package:bloc_sample_todo_app/blocs/selected_filter/selected_filter_bloc.dart';
import 'package:bloc_sample_todo_app/blocs/todos/todos_bloc.dart';
import 'package:bloc_sample_todo_app/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodosBloc>(create: (_) => TodosBloc()),
        BlocProvider<SelectedFilterBloc>(create: (_) => SelectedFilterBloc()),
        BlocProvider<SearchTermBloc>(create: (_) => SearchTermBloc()),
        BlocProvider<FilteredTodosBloc>(create: (_) => FilteredTodosBloc()),
        BlocProvider<ActiveTodosCountBloc>(
            create: (_) => ActiveTodosCountBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
