import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/filter/data/filter_repository.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/bloc/filter_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/widgets/filter_sections/store_filter_section.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/widgets/widgets.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/bloc/period_picker_bloc.dart';
import 'package:psm_incentive/features/store/data/store_repository.dart';
import 'package:psm_incentive/features/store/presentation/store_picker/bloc/store_picker_bloc.dart';
import 'package:psm_incentive/shared/widgets/apply_button.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

import 'widgets/filter_sections/period_filter_section.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({
    super.key,
    required this.onResetFilter,
    this.showJobRoleSection = false,
    this.showStoreSection = false,
  });

  final Function() onResetFilter;

  final bool showJobRoleSection;
  final bool showStoreSection;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PeriodPickerBloc(repository: FilterRepository())
            ..add(PeriodPickerGetPeriodList()),
        ),
        BlocProvider(
          create: (context) => StorePickerBloc(repository: StoreRepository())
            ..add(StorePickerGetStoreList()),
        )
      ],
      child: FilterSheetView(
        onResetFilter: onResetFilter,
        showJobRoleSection: showJobRoleSection,
        showStoreSection: showStoreSection,
      ),
    );
  }
}

class FilterSheetView extends StatelessWidget {
  const FilterSheetView({
    super.key,
    required this.onResetFilter,
    required this.showJobRoleSection,
    required this.showStoreSection,
  });

  final Function() onResetFilter;

  final bool showJobRoleSection;
  final bool showStoreSection;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(largeRadius),
          topRight: Radius.circular(largeRadius),
        ),
        color: context.colorScheme.primaryContainer,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _FilterHeader(
              onResetFilter: onResetFilter,
            ),
            const PeriodFilterSection(),
            const SortFilterSection(),
            if (showJobRoleSection) const JobRoleFilterSection(),
            if (showStoreSection) const StoreFilterSection(),
            ApplyButton(
              onTap: () {
                context.read<FilterBloc>().add(FilterApplyButtonPressed());
              },
            )
          ],
        ),
      ),
    );
  }
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader({
    required this.onResetFilter,
  });

  final Function() onResetFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.strings.filterLabel,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextButton(
              onPressed: () {
                onResetFilter();
                context.read<FilterBloc>().add(FilterResetButtonPressed());
              },
              child: Text(context.strings.resetFilterLabel),
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}