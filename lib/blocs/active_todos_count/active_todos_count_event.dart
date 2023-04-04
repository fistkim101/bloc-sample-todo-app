part of 'active_todos_count_bloc.dart';

abstract class ActiveTodosCountEvent extends Equatable {
  const ActiveTodosCountEvent();
}

class CalculateActiveTodosCountEvent extends ActiveTodosCountEvent {
  final List<TodoModel> todos;

  const CalculateActiveTodosCountEvent({
    required this.todos,
  });

  @override
  List<Object?> get props => [todos];
}
