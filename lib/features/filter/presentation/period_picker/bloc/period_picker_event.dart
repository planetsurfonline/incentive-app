part of 'period_picker_bloc.dart';

sealed class PeriodPickerEvent extends Equatable {
  const PeriodPickerEvent();

  @override
  List<Object> get props => [];
}

final class PeriodPickerGetPeriodList extends PeriodPickerEvent {}

final class PeriodPickerPopulatePeriodList extends PeriodPickerEvent {
  final List<Period> periods;

  const PeriodPickerPopulatePeriodList({required this.periods});

  @override
  List<Object> get props => [periods];
}

final class PeriodPickerChangeYear extends PeriodPickerEvent {
  final int year;

  const PeriodPickerChangeYear({required this.year});

  @override
  List<Object> get props => [year];
}

final class PeriodPickerChangePeriod extends PeriodPickerEvent {
  final Period period;

  const PeriodPickerChangePeriod({required this.period});

  @override
  List<Object> get props => [period];
}

final class PeriodPickerChangeMonth extends PeriodPickerEvent {
  final int month;

  const PeriodPickerChangeMonth({required this.month});

  @override
  List<Object> get props => [month];
}

final class PeriodPickerChangeStartDate extends PeriodPickerEvent {
  final DateTime startDate;

  const PeriodPickerChangeStartDate({required this.startDate});

  @override
  List<Object> get props => [startDate];
}

final class PeriodPickerChangeEndDate extends PeriodPickerEvent {
  final DateTime endDate;

  const PeriodPickerChangeEndDate({required this.endDate});

  @override
  List<Object> get props => [endDate];
}

final class PeriodPickerUpdateOption extends PeriodPickerEvent {
  final Period selectedPeriod;

  const PeriodPickerUpdateOption({required this.selectedPeriod});

  @override
  List<Object> get props => [selectedPeriod];
}

final class PeriodPickerApplyFilter extends PeriodPickerEvent {}
