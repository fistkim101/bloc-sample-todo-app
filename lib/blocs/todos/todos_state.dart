part of 'todos_bloc.dart';

class TodosState extends Equatable {
  final List<TodoModel> todos;

  const TodosState({
    required this.todos,
  });

  factory TodosState.initial() {
    return const TodosState(todos: []);
  }

  TodosState copyWith({
    List<TodoModel>? todos,
  }) {
    return TodosState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object> get props => [todos];
}
