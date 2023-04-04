import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/models/models.dart';
import '../../utils/uuid.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosState.initial()) {
    on<AddTodoEvent>((event, emit) {
      TodoModel newTodo =
          TodoModel(id: uuid.v4(), description: event.description);
      emit(state.copyWith(todos: [...state.todos, newTodo]));
    });

    on<RemoveTodoEvent>((event, emit) {
      List<TodoModel> newTodos =
          state.todos.where((todo) => todo.id != event.id).toList();

      emit(state.copyWith(todos: [...newTodos]));
    });

    on<ToggleTodoEvent>((event, emit) {
      List<TodoModel> newTodos = state.todos.map((todo) {
        if (todo.id == event.id) {
          return TodoModel(
              id: todo.id,
              description: todo.description,
              isCompleted: !todo.isCompleted);
        }

        return todo;
      }).toList();

      emit(state.copyWith(todos: [...newTodos]));
    });
  }
}
