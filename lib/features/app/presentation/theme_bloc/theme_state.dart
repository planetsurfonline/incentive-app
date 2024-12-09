part of 'theme_bloc.dart';

final class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final Locale? locale;

  const ThemeState({
    this.themeMode = ThemeMode.light,
    this.locale,
  });

  bool get isLightMode => themeMode == ThemeMode.light;

  ThemeState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [
        themeMode,
        isLightMode,
        locale,
      ];
}
