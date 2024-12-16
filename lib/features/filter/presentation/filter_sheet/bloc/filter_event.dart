part of 'filter_bloc.dart';

sealed class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

final class FilterChangeSelectedPeriod extends FilterEvent {
  final Period selectedPeriod;

  const FilterChangeSelectedPeriod({required this.selectedPeriod});

  @override
  List<Object> get props => [selectedPeriod];
}

final class FilterChangeSelectedSort extends FilterEvent {
  final SortType selectedSort;

  const FilterChangeSelectedSort({required this.selectedSort});
  @override
  List<Object> get props => [selectedSort];
}

final class FilterChangeSelectedJobRole extends FilterEvent {
  final JobRole selectedJobRole;

  const FilterChangeSelectedJobRole({required this.selectedJobRole});

  @override
  List<Object> get props => [selectedJobRole];
}

final class FilterChangeSelectedStore extends FilterEvent {
  final Store selectedStore;

  const FilterChangeSelectedStore({required this.selectedStore});

  @override
  List<Object> get props => [selectedStore];
}

final class FilterResetButtonPressed extends FilterEvent {}

final class FilterApplyButtonPressed extends FilterEvent {}
