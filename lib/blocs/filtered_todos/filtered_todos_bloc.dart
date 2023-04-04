import 'package:bloc/bloc.dart';
import 'package:bloc_sample_todo_app/domain/models/models.dart';
import 'package:bloc_sample_todo_app/enums/enums.dart';
import 'package:equatable/equatable.dart';

part 'filtered_todos_event.dart';
part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  FilteredTodosBloc() : super(FilteredTodosState.initial()) {
    on<CalculateFilteredTodosEvent>((event, emit) {
      final List<TodoModel> _currentTodos = event.currentTodos;
      final FilterType _selectedFilter = event.selectedFilter;
      final String _searchTerm = event.searchTerm;

      List<TodoModel> _filteredTodos;

      switch (_selectedFilter) {
        case FilterType.active:
          _filteredTodos = _currentTodos
              .where((TodoModel todo) => !todo.isCompleted)
              .toList();
          break;
        case FilterType.completed:
          _filteredTodos = _currentTodos
              .where((TodoModel todo) => todo.isCompleted)
              .toList();
          break;
        case FilterType.all:
        default:
          _filteredTodos = _currentTodos;
          break;
      }

      if (_searchTerm.isNotEmpty) {
        _filteredTodos = _filteredTodos
            .where((TodoModel todo) => todo.description
                .toLowerCase()
                .contains(_searchTerm.toLowerCase()))
            .toList();
      }

      emit(state.copyWith(filteredTodos: _filteredTodos));
    });
  }
}
