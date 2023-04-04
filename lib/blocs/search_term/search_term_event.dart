part of 'search_term_bloc.dart';

abstract class SearchTermEvent extends Equatable {
  const SearchTermEvent();
}

class NewSearchEvent extends SearchTermEvent {
  final String newSearchTerm;

  const NewSearchEvent({
    required this.newSearchTerm,
  });

  @override
  List<Object?> get props => [newSearchTerm];
}
