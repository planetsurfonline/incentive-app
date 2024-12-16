part of 'store_picker_bloc.dart';

sealed class StorePickerEvent extends Equatable {
  const StorePickerEvent();

  @override
  List<Object> get props => [];
}

final class StorePickerGetStoreList extends StorePickerEvent {}

final class StorePickerSearchChange extends StorePickerEvent {
  final String searchQuery;

  const StorePickerSearchChange({required this.searchQuery});

  @override
  List<Object> get props => [searchQuery];
}

final class StorePickerStorePicked extends StorePickerEvent {
  final Store pickedStore;

  const StorePickerStorePicked({required this.pickedStore});

  @override
  List<Object> get props => [pickedStore];
}

final class StorePickerUpdateOptions extends StorePickerEvent {}
