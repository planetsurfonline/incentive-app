import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/bloc/filter_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/widgets/widgets.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/bloc/period_picker_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/period_filter_sheet.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class PeriodFilterSection extends StatelessWidget {
  const PeriodFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterItemHeader(
          title: context.strings.periodLabel,
          onSeeAll: () async {
            final result = await showModalBottomSheet(
              context: context,
              builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<PeriodPickerBloc>(context),
                  child: const PeriodFilterSheet(),
                );
              },
            ) as bool?;

            if (result != null && context.mounted) {
              if (result) {
                // TODO: Update optionedPeriod to add the selected period

                context
                    .read<PeriodPickerBloc>()
                    .add(PeriodPickerUpdateOption());
              }
            }
          },
        ),
        BlocBuilder<PeriodPickerBloc, PeriodPickerState>(
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const FilterSectionLoading();
            }

            if (state.status == Status.error) {
              return const Text(
                'No period available. Try selecting custom date',
              );
            }

            return Wrap(
              runSpacing: mediumSmallPadding,
              spacing: smallPadding,
              children: [
                ...state.optionedPeriods.map(
                  (period) => BlocBuilder<FilterBloc, FilterState>(
                    builder: (context, filterState) {
                      return SelectableFilterItem(
                          item: period,
                          isSelected: filterState.period == period,
                          onSelected: () {
                            // TODO: Update period in filter state
                            context
                                .read<FilterBloc>()
                                .add(FilterChangeSelectedPeriod(
                                  selectedPeriod: period,
                                ));
                          });
                    },
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
