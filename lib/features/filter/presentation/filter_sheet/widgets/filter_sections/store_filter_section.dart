import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/bloc/filter_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/widgets/widgets.dart';
import 'package:psm_incentive/features/store/presentation/store_picker/bloc/store_picker_bloc.dart';
import 'package:psm_incentive/features/store/presentation/store_picker/store_filter_sheet.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class StoreFilterSection extends StatelessWidget {
  const StoreFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterItemHeader(
          title: context.strings.storeLabel,
          onSeeAll: () async {
            final result = await showModalBottomSheet(
              context: context,
              backgroundColor: context.colorScheme.primaryContainer,
              builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<StorePickerBloc>(context),
                  child: const StoreFilterSheet(),
                );
              },
            ) as bool?;

            if (result != null && context.mounted) {
              if (result) {
                final store =
                    context.read<StorePickerBloc>().state.selectedStore!;
                context
                    .read<FilterBloc>()
                    .add(FilterChangeSelectedStore(selectedStore: store));

                context.read<StorePickerBloc>().add(StorePickerUpdateOptions());
              }
            }
          },
        ),
        BlocBuilder<StorePickerBloc, StorePickerState>(
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const FilterSectionLoading();
            }

            if (state.status == Status.error) {
              return const Text(
                'No store available',
              );
            }

            return Wrap(
              runSpacing: mediumSmallPadding,
              spacing: smallPadding,
              children: [
                ...state.optionedStores.map(
                  (store) => BlocBuilder<FilterBloc, FilterState>(
                    builder: (context, filterState) {
                      return SelectableFilterItem(
                          item: store,
                          isSelected: filterState.store == store,
                          onSelected: () {
                            // TODO: Update store in filter state
                            context
                                .read<FilterBloc>()
                                .add(FilterChangeSelectedStore(
                                  selectedStore: store,
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
