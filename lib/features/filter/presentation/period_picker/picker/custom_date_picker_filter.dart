import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/bloc/period_picker_bloc.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:psm_incentive/utils/formatter/date_formatter.dart';

class CustomDatePickerFilter extends StatefulWidget {
  const CustomDatePickerFilter({super.key});

  @override
  State<CustomDatePickerFilter> createState() => _CustomDatePickerFilterState();
}

class _CustomDatePickerFilterState extends State<CustomDatePickerFilter> {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    var startDate = context.read<PeriodPickerBloc>().state.startDate ?? today;
    var dates = [today];

    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        firstDate: DateTime(2023),
        lastDate: today,
        hideYearPickerDividers: true,
        hideMonthPickerDividers: true,
        calendarType: CalendarDatePicker2Type.range,
        firstDayOfWeek: 1,
        selectedDayTextStyle: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        modePickerBuilder: ({isMonthPicker, required monthDate}) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: context.customColor!.borderColor!),
              borderRadius: BorderRadius.circular(mediumRadius),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            padding: const EdgeInsets.only(
              left: padding,
              right: mediumSmallPadding,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: mediumSmallPadding,
            ),
            child: Center(
              child: Row(
                children: [
                  Text(
                    isMonthPicker != null
                        ? DateFormatter.getMonthName(monthDate.month)
                        : monthDate.year.toString(),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          );
        },
        daySplashColor: Colors.transparent,
        yearBuilder: ({
          decoration,
          isCurrentYear,
          isDisabled,
          isSelected,
          textStyle,
          required year,
        }) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: isSelected!
                    ? context.customColor?.invertedProgressColor
                    : Colors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(radius * 2),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: mediumSmallPadding,
                horizontal: padding,
              ),
              child: Text(
                year.toString(),
                style: GoogleFonts.inter(
                  decoration: isDisabled!
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: isDisabled
                      ? Colors.grey
                      : isSelected
                          ? Colors.white
                          : Theme.of(context).textTheme.bodyMedium?.color,
                  fontWeight: isDisabled ? FontWeight.normal : FontWeight.w600,
                ),
              ),
            ),
          );
        },
        controlsTextStyle: Theme.of(context).textTheme.bodyMedium,
        weekdayLabelTextStyle: Theme.of(context).textTheme.labelMedium,
        monthBuilder: ({
          decoration,
          isCurrentMonth,
          isDisabled,
          isSelected,
          textStyle,
          required month,
        }) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: isSelected!
                    ? context.customColor?.invertedProgressColor
                    : Colors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(radius * 2),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: mediumSmallPadding,
                horizontal: padding,
              ),
              child: Text(
                DateFormatter.getMonthName(month),
                style: GoogleFonts.inter(
                  decoration: isDisabled!
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: isDisabled
                      ? Colors.grey
                      : isSelected
                          ? Colors.white
                          : Theme.of(context).textTheme.bodyMedium?.color,
                  fontWeight: isDisabled ? FontWeight.normal : FontWeight.w600,
                ),
              ),
            ),
          );
        },
        dayBuilder: ({
          required date,
          decoration,
          isDisabled,
          isSelected,
          isToday,
          textStyle,
        }) {
          BorderRadius? dateRadius;

          if (isToday!) {
            dateRadius = (dates.length > 1 && dates[1].day == date.day)
                ? const BorderRadius.only(
                    topRight: Radius.circular(radius),
                    bottomRight: Radius.circular(radius),
                  )
                : BorderRadius.circular(radius);
          } else if (isToday && isSelected!) {
            dateRadius = const BorderRadius.only(
              topRight: Radius.circular(radius),
              bottomRight: Radius.circular(radius),
            );
          } else {
            dateRadius = (date.day == startDate.day)
                ? const BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    bottomLeft: Radius.circular(radius),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(radius),
                    bottomRight: Radius.circular(radius),
                  );
          }

          return Container(
            decoration: BoxDecoration(
              color: isSelected!
                  ? context.customColor?.invertedProgressColor
                  : Colors.transparent,
              borderRadius: dateRadius,
            ),
            child: Center(
              child: Text(
                date.day.toString(),
                style: GoogleFonts.inter(
                  decoration: isDisabled!
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: isToday && !isSelected
                      ? context.customColor?.invertedProgressColor
                      : isDisabled
                          ? Colors.grey
                          : isSelected
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ),
          );
        },
      ),
      value: dates,
      onValueChanged: (newDates) {
        if (newDates.length == 1) {
          startDate = newDates[0];
          context
              .read<PeriodPickerBloc>()
              .add(PeriodPickerChangeStartDate(startDate: startDate));
          return;
        }
        if (newDates.length > 1) {
          if (newDates[0] == newDates[1]) return;
        }
        dates = newDates;
        context
            .read<PeriodPickerBloc>()
            .add(PeriodPickerChangeEndDate(endDate: newDates[1]));
      },
    );
  }
}
