part of 'selected_filter_bloc.dart';

class SelectedFilterState extends Equatable {
  final FilterType selectedFilter;

  const SelectedFilterState({
    required this.selectedFilter,
  });

  factory SelectedFilterState.initial() {
    return const SelectedFilterState(selectedFilter: FilterType.all);
  }

  @override
  List<Object> get props => [selectedFilter];

  SelectedFilterState copyWith({
    FilterType? selectedFilter,
  }) {
    return SelectedFilterState(
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}
