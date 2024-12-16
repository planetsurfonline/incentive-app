import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/bloc/filter_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/widgets/widgets.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class SortFilterSection extends StatelessWidget {
  const SortFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SortType> sortTypeList = SortType.sortList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterItemHeader(title: context.strings.sortLabel),
        Wrap(
          runSpacing: mediumSmallPadding,
          spacing: smallPadding,
          children: [
            ...sortTypeList.map(
              (sort) => BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  return SelectableFilterItem(
                      item: sort,
                      isSelected: state.sortType == sort,
                      onSelected: () {
                        // TODO: Update sort in filter state
                        context.read<FilterBloc>().add(FilterChangeSelectedSort(
                              selectedSort: sort,
                            ));
                      });
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
