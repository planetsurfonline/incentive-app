part of 'theme_bloc.dart';

final class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final Locale? locale;
  final bool showNominal;

  const ThemeState({
    this.themeMode = ThemeMode.light,
    this.locale,
    this.showNominal = true,
  });

  bool get isLightMode => themeMode == ThemeMode.light;

  ThemeState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    bool? showNominal,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      showNominal: showNominal ?? this.showNominal,
    );
  }

  @override
  List<Object?> get props => [
        themeMode,
        isLightMode,
        locale,
        showNominal,
      ];
}
