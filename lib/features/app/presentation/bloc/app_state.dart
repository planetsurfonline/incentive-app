part of 'app_bloc.dart';

enum AppAuthStatus { authenticated, unauthenticated, initial, unknown }

final class AppState extends Equatable {
  final AppAuthStatus status;
  final IncentiveUser? user;

  const AppState({
    this.status = AppAuthStatus.initial,
    this.user,
  });

  AppState copyWith(
      {AppAuthStatus? status, IncentiveUser? user, ThemeMode? themeMode}) {
    return AppState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        status,
        user,
      ];
}
