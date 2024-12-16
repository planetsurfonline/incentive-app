part of 'period_picker_bloc.dart';

enum PeriodTab { period, month, custom }

class PeriodPickerState extends Equatable {
  final List<Period> periods;
  final List<Period> displayedPeriods;
  final List<Period> optionedPeriods;
  final Period currentPeriod;
  final Period? selectedPeriod;
  final Status status;
  final String message;
  final DateTime? startDate;
  final DateTime? endDate;
  final int currentYear;
  final int currentMonth;
  final PeriodTab periodTab;

  PeriodPickerState({
    this.periods = const [],
    this.displayedPeriods = const [],
    this.optionedPeriods = const [],
    Period? currentPeriod,
    this.selectedPeriod,
    this.status = Status.loading,
    this.message = '',
    DateTime? startDate,
    DateTime? endDate,
    int? currentYear,
    int? currentMonth,
    this.periodTab = PeriodTab.period,
  })  : startDate = startDate ?? DateTime.now(),
        endDate = endDate ?? DateTime.now(),
        currentYear = currentYear ?? DateTime.now().year,
        currentMonth = currentMonth ?? DateTime.now().month,
        currentPeriod = currentPeriod ??
            Period(
              name: 'Today',
              startDate: DateTime.now(),
              endDate: DateTime.now(),
            );

  // Period get selectedPeriod =

  @override
  List<Object?> get props => [
        periods,
        displayedPeriods,
        optionedPeriods,
        currentPeriod,
        selectedPeriod,
        status,
        message,
        startDate,
        endDate,
        currentYear,
        currentMonth,
        periodTab,
      ];

  PeriodPickerState copyWith({
    List<Period>? periods,
    List<Period>? displayedPeriods,
    List<Period>? optionedPeriods,
    Period? currentPeriod,
    Period? selectedPeriod,
    Status? status,
    String? message,
    DateTime? startDate,
    DateTime? endDate,
    int? currentYear,
    int? currentMonth,
    PeriodTab? periodTab,
  }) {
    return PeriodPickerState(
      periods: periods ?? this.periods,
      displayedPeriods: displayedPeriods ?? this.displayedPeriods,
      optionedPeriods: optionedPeriods ?? this.optionedPeriods,
      currentPeriod: currentPeriod ?? this.currentPeriod,
      selectedPeriod: selectedPeriod ?? this.selectedPeriod,
      status: status ?? this.status,
      message: message ?? this.message,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      currentYear: currentYear ?? this.currentYear,
      currentMonth: currentMonth ?? this.currentMonth,
      periodTab: periodTab ?? this.periodTab,
    );
  }
}
