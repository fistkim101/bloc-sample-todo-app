import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increase() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrease() {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
