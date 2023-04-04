part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
}

class AddTodoEvent extends TodosEvent {
  final String description;

  const AddTodoEvent({
    required this.description,
  });

  @override
  List<Object?> get props => [description];
}

class RemoveTodoEvent extends TodosEvent {
  final String id;

  const RemoveTodoEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class ToggleTodoEvent extends TodosEvent {
  final String id;

  const ToggleTodoEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
