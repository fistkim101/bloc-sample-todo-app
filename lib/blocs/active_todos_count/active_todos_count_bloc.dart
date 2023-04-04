import 'package:bloc/bloc.dart';
import 'package:bloc_sample_todo_app/domain/models/models.dart';
import 'package:equatable/equatable.dart';

part 'active_todos_count_event.dart';
part 'active_todos_count_state.dart';

class ActiveTodosCountBloc
    extends Bloc<ActiveTodosCountEvent, ActiveTodosCountState> {
  ActiveTodosCountBloc() : super(ActiveTodosCountState.initial()) {
    on<CalculateActiveTodosCountEvent>((event, emit) {
      int activeTodosCount =
          event.todos.where((todo) => !todo.isCompleted).toList().length;
      emit(state.copyWith(activeTodoCount: activeTodosCount));
    });
  }
}
