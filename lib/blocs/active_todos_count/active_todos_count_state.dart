part of 'active_todos_count_bloc.dart';

class ActiveTodosCountState extends Equatable {
  final int activeTodoCount;

  const ActiveTodosCountState({
    required this.activeTodoCount,
  });

  factory ActiveTodosCountState.initial() {
    return const ActiveTodosCountState(activeTodoCount: 0);
  }

  ActiveTodosCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodosCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }

  @override
  List<Object?> get props => [activeTodoCount];
}
