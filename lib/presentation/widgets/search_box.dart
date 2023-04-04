import 'package:bloc_sample_todo_app/blocs/search_term/search_term_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: const InputDecoration(
        labelText: 'Search Todos...',
        border: InputBorder.none,
        filled: true,
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (searchTerm) => context
          .read<SearchTermBloc>()
          .add(NewSearchEvent(newSearchTerm: searchTerm)),
    );
  }
}
