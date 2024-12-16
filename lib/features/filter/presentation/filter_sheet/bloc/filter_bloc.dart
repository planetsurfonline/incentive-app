import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/features/store/domain/store.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<FilterChangeSelectedPeriod>(_onFilterChangeSelectedPeriod);
    on<FilterChangeSelectedSort>(_onFilterChangeSelectedSort);
    on<FilterChangeSelectedJobRole>(_onFilterChangeSelectedJobRole);
    on<FilterChangeSelectedStore>(_onFilterChangeSelectedStore);

    on<FilterResetButtonPressed>(_onFilterResetButtonPressed);
    on<FilterApplyButtonPressed>(_onFilterApplyButtonPressed);
  }

  void _onFilterChangeSelectedPeriod(
    FilterChangeSelectedPeriod event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(
      period: event.selectedPeriod,
      sortType: state.sortType,
      jobRole: state.jobRole,
      store: state.store,
    ));
  }

  void _onFilterChangeSelectedSort(
    FilterChangeSelectedSort event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(
      period: state.period,
      sortType: event.selectedSort,
      jobRole: state.jobRole,
      store: state.store,
    ));
  }

  void _onFilterChangeSelectedJobRole(
    FilterChangeSelectedJobRole event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(
      period: state.period,
      sortType: state.sortType,
      jobRole: event.selectedJobRole,
      store: state.store,
    ));
  }

  void _onFilterChangeSelectedStore(
    FilterChangeSelectedStore event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(
      period: state.period,
      sortType: state.sortType,
      jobRole: state.jobRole,
      store: event.selectedStore,
    ));
  }

  void _onFilterResetButtonPressed(
    _,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(
      period: null,
      sortType: null,
      jobRole: null,
      store: null,
    ));
  }

  Future<void> _onFilterApplyButtonPressed(
    _,
    Emitter<FilterState> emit,
  ) async {
    try {
      // TODO: Apply filter
      log(state.period.toString());
      log(state.sortType.toString());
      log(state.jobRole.toString());
      log(state.store.toString());
    } catch (e) {
      log('FilterBloc _onFilterApplyButtonPressed => ${e.toString()}');
    }
  }
}
