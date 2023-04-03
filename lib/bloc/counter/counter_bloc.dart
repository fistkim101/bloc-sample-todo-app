import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../counter_cubit.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncreaseCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<DecreaseCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }


}
