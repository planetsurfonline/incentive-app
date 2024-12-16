import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:psm_incentive/features/store/data/store_repository.dart';
import 'package:psm_incentive/features/store/domain/models.dart';
import 'package:psm_incentive/shared/enum/status.dart';

part 'store_picker_event.dart';
part 'store_picker_state.dart';

class StorePickerBloc extends Bloc<StorePickerEvent, StorePickerState> {
  final StoreRepository _repository;

  StorePickerBloc({
    required StoreRepository repository,
  })  : _repository = repository,
        super(const StorePickerState()) {
    on<StorePickerEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<StorePickerGetStoreList>(_onStorePickerGetStoreList);

    on<StorePickerSearchChange>(_onStorePickerSearchChange);

    on<StorePickerStorePicked>(_onStorePickerStorePicked);

    on<StorePickerUpdateOptions>(_onStorePickerUpdateOptions);
  }

  Future<void> _onStorePickerGetStoreList(
    _,
    Emitter<StorePickerState> emit,
  ) async {
    try {
      final result = await _repository.getStoreList();

      emit(state.copyWith(
        status: Status.success,
        storeList: result,
        displayedStores: result,
        optionedStores:
            result.getRange(0, result.length > 3 ? 3 : result.length).toList(),
      ));
    } catch (e) {
      log('StorePickerBloc _onStorePickerGetStoreList => ${e.toString()}');

      emit(state.copyWith(status: Status.error));
    }
  }

  void _onStorePickerSearchChange(
    StorePickerSearchChange event,
    Emitter<StorePickerState> emit,
  ) {
    emit(state.copyWith(
      displayedStores: state.storeList
          .where((store) =>
              store.storeName.toLowerCase().contains(event.searchQuery))
          .toList(),
    ));
  }

  void _onStorePickerStorePicked(
    StorePickerStorePicked event,
    Emitter<StorePickerState> emit,
  ) {
    emit(state.copyWith(selectedStore: event.pickedStore));
  }

  void _onStorePickerUpdateOptions(
    _,
    Emitter<StorePickerState> emit,
  ) {
    List<Store>? updatedOptions = [
      state.selectedStore!,
      ...state.optionedStores
    ];

    emit(state.copyWith(
      optionedStores: updatedOptions,
    ));
  }
}
