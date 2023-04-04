import 'package:bloc/bloc.dart';
import 'package:bloc_sample_todo_app/enums/enums.dart';
import 'package:equatable/equatable.dart';

part 'selected_filter_event.dart';
part 'selected_filter_state.dart';

class SelectedFilterBloc
    extends Bloc<SelectedFilterEvent, SelectedFilterState> {
  SelectedFilterBloc() : super(SelectedFilterState.initial()) {
    on<ChangeFilterEvent>((event, emit) {
      emit(state.copyWith(selectedFilter: event.selectedFilter));
    });
  }
}
