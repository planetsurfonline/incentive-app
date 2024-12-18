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
    this.showJobRoleSection = false,
    this.showStoreSection = false,
  });

  final bool showJobRoleSection;
  final bool showStoreSection;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PeriodPickerBloc(
            context: context,
            repository: FilterRepository(),
          )..add(PeriodPickerGetPeriodList()),
        ),
        BlocProvider(
          create: (context) => StorePickerBloc(repository: StoreRepository())
            ..add(StorePickerGetStoreList()),
        )
      ],
      child: FilterSheetView(
        showJobRoleSection: showJobRoleSection,
        showStoreSection: showStoreSection,
      ),
    );
  }
}

class FilterSheetView extends StatelessWidget {
  const FilterSheetView({
    super.key,
    required this.showJobRoleSection,
    required this.showStoreSection,
  });

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
            const _FilterHeader(),
            const PeriodFilterSection(),
            const SortFilterSection(),
            if (showJobRoleSection) const JobRoleFilterSection(),
            if (showStoreSection) const StoreFilterSection(),
            ApplyButton(
              onTap: () {
                final state = context.read<FilterBloc>().state;
                Navigator.of(context).pop(state);
              },
            )
          ],
        ),
      ),
    );
  }
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader();

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
