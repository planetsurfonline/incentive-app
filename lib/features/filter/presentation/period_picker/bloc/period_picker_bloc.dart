import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:psm_incentive/features/filter/data/filter_repository.dart';
import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/utils/formatter/date_formatter.dart';

part 'period_picker_event.dart';
part 'period_picker_state.dart';

class PeriodPickerBloc extends Bloc<PeriodPickerEvent, PeriodPickerState> {
  final FilterRepository _repository;

  PeriodPickerBloc({required FilterRepository repository})
      : _repository = repository,
        super(PeriodPickerState()) {
    on<PeriodPickerPopulatePeriodList>(_onPeriodPickerPopulatePeriodList);

    on<PeriodPickerGetPeriodList>(_onPeriodPickerGetPeriodList);

    on<PeriodPickerChangeYear>(_onPeriodPickerChangeYear);
    on<PeriodPickerChangeMonth>(_onPeriodPickerChangeMonth);
    on<PeriodPickerChangePeriod>(_onPeriodPickerChangePeriod);
    on<PeriodPickerApplyFilter>(_onPeriodPickerApplyFilter);

    on<PeriodPickerChangeStartDate>(_onPeriodPickerChangeStartDate);
    on<PeriodPickerChangeEndDate>(_onPeriodPickerChangeEndDate);
  }

  Future<void> _onPeriodPickerGetPeriodList(
    _,
    Emitter<PeriodPickerState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      List<Period> periods = await _repository.getPeriodList();

      final displayedPeriods = periods.where((period) {
        return period.endDate.year == state.currentYear;
      }).toList();

      emit(state.copyWith(
        status: Status.success,
        periods: periods,
        displayedPeriods: displayedPeriods,
      ));
    } catch (e) {
      log('PeriodPickerBloc _onPeriodPickerGetPeriodList => ${e.toString()}');

      emit(state.copyWith(status: Status.error));
    }
  }

  void _onPeriodPickerPopulatePeriodList(
    PeriodPickerPopulatePeriodList event,
    Emitter<PeriodPickerState> emit,
  ) {
    log('PeriodPickerBloc _onPeriodPickerPopulatePeriodList');

    emit(state.copyWith(
      status: Status.success,
      periods: event.periods,
    ));
  }

  void _onPeriodPickerChangeYear(
    PeriodPickerChangeYear event,
    Emitter<PeriodPickerState> emit,
  ) {
    final displayedPeriods = state.periods
        .where((period) => period.endDate.year == event.year)
        .toList();

    emit(state.copyWith(
      displayedPeriods: displayedPeriods,
      currentYear: event.year,
      selectedPeriod: Period(
        name: '${DateFormatter.getMonthName(state.currentMonth)} ${event.year}',
        startDate: DateTime(event.year, state.currentMonth),
        endDate: DateTime(event.year, state.currentMonth + 1).subtract(
          const Duration(seconds: 1),
        ),
      ),
    ));
  }

  void _onPeriodPickerChangeMonth(
    PeriodPickerChangeMonth event,
    Emitter<PeriodPickerState> emit,
  ) {
    DateTime startDate = DateTime(state.currentYear, event.month);
    DateTime endDate = DateTime(state.currentYear, event.month + 1)
        .subtract(const Duration(seconds: 1));

    Period newPeriod = Period(
      name: '${DateFormatter.getMonthName(event.month)} ${state.currentYear}',
      startDate: startDate,
      endDate: endDate,
    );

    emit(state.copyWith(
      currentMonth: event.month,
      selectedPeriod: newPeriod,
      startDate: startDate,
      endDate: endDate,
    ));
  }

  void _onPeriodPickerChangePeriod(
    PeriodPickerChangePeriod event,
    Emitter<PeriodPickerState> emit,
  ) {
    log(event.period.name);
    emit(state.copyWith(
      selectedPeriod: event.period,
    ));
  }

  void _onPeriodPickerChangeStartDate(
    PeriodPickerChangeStartDate event,
    Emitter<PeriodPickerState> emit,
  ) {
    String periodName = DateTime.now().difference(event.startDate) <
            const Duration(days: 1)
        ? 'Today'
        : '${event.startDate.day} ${DateFormatter.getMonthName(event.startDate.month)} ${event.startDate.year}';

    Period newPeriod = Period(
      name: periodName,
      startDate: event.startDate,
      endDate: event.startDate,
    );

    emit(state.copyWith(
      selectedPeriod: newPeriod,
      startDate: event.startDate,
      endDate: event.startDate,
    ));
  }

  void _onPeriodPickerChangeEndDate(
    PeriodPickerChangeEndDate event,
    Emitter<PeriodPickerState> emit,
  ) {
    String currentPeriodName = state.selectedPeriod?.name ?? '';
    String periodName =
        '$currentPeriodName - ${event.endDate.day} ${DateFormatter.getMonthName(event.endDate.month)} ${event.endDate.year}';

    Period newPeriod = Period(
      name: periodName,
      startDate: state.startDate!,
      endDate: event.endDate,
    );

    emit(state.copyWith(
      selectedPeriod: newPeriod,
      endDate: event.endDate,
    ));
  }

  Future<void> _onPeriodPickerApplyFilter(
    _,
    Emitter<PeriodPickerState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    // await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      status: Status.success,
      currentPeriod: state.selectedPeriod,
      startDate: state.selectedPeriod?.startDate,
      endDate: state.selectedPeriod?.endDate,
    ));
  }
}
