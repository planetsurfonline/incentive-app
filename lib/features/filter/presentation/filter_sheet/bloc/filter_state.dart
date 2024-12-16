part of 'filter_bloc.dart';

final class FilterState extends Equatable {
  final SortType? sortType;
  final JobRole? jobRole;
  final Period? period;
  final Store? store;

  const FilterState({
    this.sortType,
    this.jobRole,
    this.period,
    this.store,
  });

  FilterState copyWith({
    SortType? sortType,
    JobRole? jobRole,
    Period? period,
    Store? store,
  }) {
    return FilterState(
      sortType: sortType,
      jobRole: jobRole,
      period: period,
      store: store,
    );
  }

  @override
  List<Object?> get props => [
        sortType,
        jobRole,
        period,
        store,
      ];
}
