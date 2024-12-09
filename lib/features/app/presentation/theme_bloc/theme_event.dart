part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

final class ThemeGetMode extends ThemeEvent {}

final class AppGetInitialLocale extends ThemeEvent {}

final class AppToggleThemeMode extends ThemeEvent {}

final class AppToggleLanguage extends ThemeEvent {
  final String localeString;

  const AppToggleLanguage({required this.localeString});

  @override
  List<Object> get props => [localeString];
}
