part of 'filtered_todos_bloc.dart';

abstract class FilteredTodosEvent extends Equatable {
  const FilteredTodosEvent();
}

class CalculateFilteredTodosEvent extends FilteredTodosEvent {
  final List<TodoModel> currentTodos;
  final FilterType selectedFilter;
  final String searchTerm;

  const CalculateFilteredTodosEvent({
    required this.currentTodos,
    required this.selectedFilter,
    required this.searchTerm,
  });

  @override
  List<Object?> get props => [currentTodos, selectedFilter, searchTerm];
}
