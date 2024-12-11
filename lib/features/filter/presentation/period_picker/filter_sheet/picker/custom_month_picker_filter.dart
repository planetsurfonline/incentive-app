import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/bloc/period_picker_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/filter_sheet/picker/pickers.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:psm_incentive/utils/formatter/date_formatter.dart';

class CustomMonthPickerFilter extends StatelessWidget {
  const CustomMonthPickerFilter({super.key});

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
          const Spacer(),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            childAspectRatio: MediaQuery.sizeOf(context).height /
                MediaQuery.sizeOf(context).width /
                2,
            children: List.generate(
              12,
              (index) {
                return BlocBuilder<PeriodPickerBloc, PeriodPickerState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        // TODO: Change current month inside state
                        // setState(() {
                        // currentMonth = index + 1;
                        context
                            .read<PeriodPickerBloc>()
                            .add(PeriodPickerChangeMonth(month: index + 1));
                        // });
                      },
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: state.currentMonth - 1 == index
                                ? context.customColor?.invertedProgressColor
                                : Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                            borderRadius:
                                BorderRadius.circular(largeRadius * 2),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: padding,
                            horizontal: largePadding,
                          ),
                          child: Text(
                            DateFormatter.getShortMonthName(index + 1),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: state.currentMonth - 1 == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
