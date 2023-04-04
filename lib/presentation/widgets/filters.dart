import 'package:bloc_sample_todo_app/blocs/selected_filter/selected_filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../enums/filter_type.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedFilterBloc, SelectedFilterState>(
      builder: (context, state) {
        final FilterType selectedFilterType = state.selectedFilter;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildFilterButton(context, FilterType.all, selectedFilterType),
            _buildFilterButton(context, FilterType.active, selectedFilterType),
            _buildFilterButton(
                context, FilterType.completed, selectedFilterType),
          ],
        );
      },
    );
  }

  Widget _buildFilterButton(
    BuildContext context,
    FilterType buildTargetFilterType,
    FilterType selectedFilterType,
  ) {
    return TextButton(
      onPressed: () {
        context
            .read<SelectedFilterBloc>()
            .add(ChangeFilterEvent(selectedFilter: buildTargetFilterType));
      },
      child: Text(
        _getFilterName(buildTargetFilterType),
        style: TextStyle(
          color: _isCurrentFilter(buildTargetFilterType, selectedFilterType)
              ? Colors.blue
              : Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }

  bool _isCurrentFilter(FilterType filterType, FilterType selectedFilterType) =>
      filterType == selectedFilterType;

  String _getFilterName(FilterType filterType) {
    if (filterType == FilterType.all) {
      return 'All';
    }
    if (filterType == FilterType.active) {
      return 'Active';
    }
    if (filterType == FilterType.completed) {
      return 'Completed';
    }

    return '';
  }
}
