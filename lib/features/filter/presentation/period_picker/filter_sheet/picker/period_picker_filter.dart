import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/bloc/period_picker_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/filter_sheet/picker/pickers.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/shared/widgets/widgets.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:shimmer/shimmer.dart';

class PeriodPickerFilter extends StatelessWidget {
  const PeriodPickerFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: padding,
        vertical: mediumSmallPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<PeriodPickerBloc, PeriodPickerState>(
            builder: (context, state) {
              return YearPickerDropdown(
                year: state.currentYear.toString(),
                initialYear: state.currentYear,
                onYearPicked: (pickedYear) {
                  context
                      .read<PeriodPickerBloc>()
                      .add(PeriodPickerChangeYear(year: pickedYear));
                },
              );
            },
          ),
          const SizedBox(height: mediumSmallPadding),
          Expanded(
            child: BlocBuilder<PeriodPickerBloc, PeriodPickerState>(
              builder: (context, state) {
                if (state.status == Status.loading) {
                  return const _PeriodLoading();
                }

                if (state.periods.isEmpty) {
                  return const Center(
                    child: ErrorView(
                      subtitle: 'Currently, period is not available',
                      icon: Stack(
                        children: [
                          Center(child: Icon(Icons.calendar_today_outlined)),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 6.0),
                              child: Icon(Icons.close, size: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: state.displayedPeriods.length,
                  itemBuilder: (context, index) {
                    return _PeriodItem(period: state.displayedPeriods[index]);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _PeriodItem extends StatelessWidget {
  const _PeriodItem({required this.period});

  final Period period;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<PeriodPickerBloc>()
            .add(PeriodPickerChangePeriod(period: period));
      },
      child: BlocBuilder<PeriodPickerBloc, PeriodPickerState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: state.selectedPeriod == period
                  ? context.customColor?.borderColor
                  : context.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: padding,
              horizontal: mediumPadding,
            ),
            child: Text(period.label,
                style: Theme.of(context).textTheme.bodyMedium),
          );
        },
      ),
    );
  }
}

class _PeriodLoading extends StatelessWidget {
  const _PeriodLoading();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: mediumSmallPadding),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 56,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: mediumSmallPadding),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 56,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: mediumSmallPadding),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 56,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: mediumSmallPadding),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 56,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: mediumSmallPadding),
      ],
    );
  }
}
