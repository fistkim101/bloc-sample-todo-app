import 'package:bloc_sample_todo_app/blocs/filtered_todos/filtered_todos_bloc.dart';
import 'package:bloc_sample_todo_app/blocs/search_term/search_term_bloc.dart';
import 'package:bloc_sample_todo_app/blocs/selected_filter/selected_filter_bloc.dart';
import 'package:bloc_sample_todo_app/blocs/todos/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TodosBloc, TodosState>(listener: (context, state) {
          context.read<FilteredTodosBloc>().add(CalculateFilteredTodosEvent(
                currentTodos: state.todos,
                selectedFilter:
                    context.read<SelectedFilterBloc>().state.selectedFilter,
                searchTerm: context.read<SearchTermBloc>().state.searchTerm,
              ));
        }),
        BlocListener<SearchTermBloc, SearchTermState>(
            listener: (context, state) {
          context.read<FilteredTodosBloc>().add(CalculateFilteredTodosEvent(
                currentTodos: context.read<TodosBloc>().state.todos,
                selectedFilter:
                    context.read<SelectedFilterBloc>().state.selectedFilter,
                searchTerm: state.searchTerm,
              ));
        }),
        BlocListener<SelectedFilterBloc, SelectedFilterState>(
            listener: (context, state) {
          context.read<FilteredTodosBloc>().add(CalculateFilteredTodosEvent(
                currentTodos: context.read<TodosBloc>().state.todos,
                selectedFilter: state.selectedFilter,
                searchTerm: context.read<SearchTermBloc>().state.searchTerm,
              ));
        }),
      ],
      child: BlocBuilder<FilteredTodosBloc, FilteredTodosState>(
        builder: (context, state) {
          return ListView.separated(
            primary: false,
            shrinkWrap: true,
            separatorBuilder: (_, __) {
              return const Divider(color: Colors.grey);
            },
            itemCount: state.filteredTodos.length,
            itemBuilder: (_, index) =>
                TodoItem(todo: state.filteredTodos[index]),
          );
        },
      ),
    );
  }
}
