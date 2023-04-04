part of 'selected_filter_bloc.dart';

abstract class SelectedFilterEvent extends Equatable {
  const SelectedFilterEvent();
}

class ChangeFilterEvent extends SelectedFilterEvent {
  final FilterType selectedFilter;

  const ChangeFilterEvent({
    required this.selectedFilter,
  });

  @override
  List<Object?> get props => [selectedFilter];
}
