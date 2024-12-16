part of 'store_picker_bloc.dart';

final class StorePickerState extends Equatable {
  final List<Store> storeList;
  final List<Store> displayedStores;
  final List<Store> optionedStores;
  final Store? selectedStore;
  final Status status;
  final String message;

  const StorePickerState({
    this.status = Status.loading,
    this.message = '',
    this.storeList = const [],
    this.displayedStores = const [],
    this.optionedStores = const [],
    this.selectedStore,
  });

  StorePickerState copyWith({
    List<Store>? storeList,
    List<Store>? optionedStores,
    List<Store>? displayedStores,
    Store? selectedStore,
    Status? status,
    String? message,
  }) {
    return StorePickerState(
      status: status ?? this.status,
      message: message ?? this.message,
      storeList: storeList ?? this.storeList,
      optionedStores: optionedStores ?? this.optionedStores,
      displayedStores: displayedStores ?? this.displayedStores,
      selectedStore: selectedStore ?? this.selectedStore,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        storeList,
        optionedStores,
        displayedStores,
        selectedStore,
      ];
}
