import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/bloc/filter_bloc.dart';
import 'package:psm_incentive/features/incentives/data/incentives_repository.dart';
import 'package:psm_incentive/features/incentives/domain/models.dart';
import 'package:psm_incentive/shared/enum/status.dart';

part 'incentive_history_event.dart';
part 'incentive_history_state.dart';

class IncentiveHistoryBloc
    extends Bloc<IncentiveHistoryEvent, IncentiveHistoryState> {
  final IncentivesRepository _repository;

  IncentiveHistoryBloc({
    required IncentivesRepository repository,
  })  : _repository = repository,
        super(const IncentiveHistoryState()) {
    on<IncentiveHistoryGetRecentData>(_onIncentiveHistoryGetRecentData);

    on<IncentiveHistoryGetHistoryData>(_onIncentiveHistoryGetHistoryData);

    on<IncentiveHistoryFilterDisplay>(_onIncentiveHistoryFilterDisplay);

    on<IncentiveHistoryGetHistoryByFilter>(
        _onIncentiveHistoryGetHistoryByFilter);
  }

  Future<void> _onIncentiveHistoryGetRecentData(
    _,
    Emitter<IncentiveHistoryState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final List<IncentiveData> items = await _repository.getRecentHistory();

      emit(state.copyWith(
        status: Status.success,
        recentHistories:
            items.getRange(0, items.length < 5 ? items.length : 5).toList(),
      ));
    } catch (e) {
      log('IncentiveHistoryBloc _onIncentiveHistoryGetRecentData => ${e.toString()}');

      emit(state.copyWith(
        status: Status.error,
        message: 'Cannot load data. Please try again',
      ));
    }
  }

  Future<void> _onIncentiveHistoryGetHistoryData(
    _,
    Emitter<IncentiveHistoryState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final List<IncentiveData> items =
          await _repository.getAllIncentiveHistory();

      emit(state.copyWith(
        status: Status.success,
        allHistories: items,
        displayedHistories: items,
      ));
    } catch (e) {
      log('IncentiveHistoryBloc _onIncentiveHistoryGetHistoryData => ${e.toString()}');

      emit(state.copyWith(
        status: Status.error,
        message: 'Cannot load data. Please try again',
      ));
    }
  }

  void _onIncentiveHistoryFilterDisplay(
    IncentiveHistoryFilterDisplay event,
    Emitter<IncentiveHistoryState> emit,
  ) {
    final displayedHistories = state.allHistories
        .where((history) => history.invoiceNumber.contains(event.searchQuery))
        .toList();

    emit(state.copyWith(displayedHistories: displayedHistories));
  }

  Future<void> _onIncentiveHistoryGetHistoryByFilter(
    IncentiveHistoryGetHistoryByFilter event,
    Emitter<IncentiveHistoryState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final List<IncentiveData> items =
          await _repository.getIncentiveHistoryByFilter(
        event.filter,
      );

      emit(state.copyWith(
        status: Status.success,
        displayedHistories: items,
      ));
    } catch (e) {
      log('IncentiveHistoryBloc _onIncentiveHistoryGetHistoryData => ${e.toString()}');

      emit(state.copyWith(
        status: Status.error,
        message: 'Cannot load data. Please try again',
      ));
    }
  }
}
