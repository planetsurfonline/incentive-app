import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/bloc/period_picker_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/period_filter_sheet.dart';
import 'package:psm_incentive/features/incentives/presentation/incentive/bloc/incentive_bloc.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/shared/widgets/widgets.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:shimmer/shimmer.dart';

class HomeFilter extends StatelessWidget {
  const HomeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
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
            context.read<PeriodPickerBloc>().add(PeriodPickerApplyFilter());
            // TODO: get amount data with filter applied
            context.read<IncentiveBloc>().add(IncentiveGetAmountData());
          }
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: context.customColor!.borderColor!),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: mediumSmallPadding,
          horizontal: padding,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: padding,
          vertical: mediumSmallPadding,
        ),
        child: BlocBuilder<PeriodPickerBloc, PeriodPickerState>(
          builder: (context, state) {
            if (state.status == Status.loading) {
              return Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.tertiaryFixed,
                highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
                child: const BannerPlaceholder(
                  height: 20,
                  width: double.infinity,
                ),
              );
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    state.currentPeriod.name == 'Today'
                        ? context.strings.todayLabel
                        : state.currentPeriod.name,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(width: padding),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
