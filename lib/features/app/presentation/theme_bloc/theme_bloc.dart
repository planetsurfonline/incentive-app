import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeGetMode>(_onThemeGetMode);
    on<AppGetInitialLocale>(_onAppGetInitialLocale);
    on<SettingGetNominalVisibility>(_onSettingGetNominalVisibility);

    on<AppToggleThemeMode>(_onAppToggleThemeMode);
    on<AppToggleLanguage>(_onAppToggleLanguage);
    on<SettingToggleNominalVisibility>(_onSettingToggleNominalVisibility);
  }

  Future<void> _onAppGetInitialLocale(
    _,
    Emitter<ThemeState> emit,
  ) async {
    try {
      final preference = await SharedPreferences.getInstance();

      final result = preference.getString('LOCALE');

      if (result == null) {
        await preference.setString('LOCALE', 'id');
        emit(state.copyWith(locale: const Locale('id', 'ID')));
      } else {
        emit(state.copyWith(locale: Locale(result, 'ID')));
      }
    } catch (e) {
      log('ThemeBloc _onAppGetInitialLocale => ${e.toString()}');
    }
  }

  Future<void> _onThemeGetMode(
    ThemeGetMode event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      final preference = await SharedPreferences.getInstance();

      final result = preference.getString('THEME_MODE') ?? ThemeMode.light.name;
      log(result);

      if (result == ThemeMode.light.name) {
        emit(state.copyWith(themeMode: ThemeMode.light));
      } else {
        emit(state.copyWith(themeMode: ThemeMode.dark));
      }
    } catch (e) {
      log('ThemeBloc _onThemeGetMode => ${e.toString()}');
    }
  }

  Future<void> _onAppToggleThemeMode(_, Emitter<ThemeState> emit) async {
    var currentTheme = state.themeMode;
    final preference = await SharedPreferences.getInstance();

    if (currentTheme == ThemeMode.light) {
      await preference.setString('THEME_MODE', ThemeMode.dark.name);
      currentTheme = ThemeMode.dark;
    } else {
      await preference.setString('THEME_MODE', ThemeMode.light.name);

      currentTheme = ThemeMode.light;
    }

    emit(state.copyWith(themeMode: currentTheme));
  }

  void _onAppToggleLanguage(
    AppToggleLanguage event,
    Emitter<ThemeState> emit,
  ) async {
    final preference = await SharedPreferences.getInstance();

    try {
      if (event.localeString.isEmpty) {
        emit(state.copyWith(
          locale: const Locale('id', 'ID'),
        ));

        return;
      }

      await preference.setString('LOCALE', event.localeString);

      emit(state.copyWith(
        locale: Locale(event.localeString, 'ID'),
      ));
    } catch (e) {
      log('ThemeBloc _onAppToggleLanguage => ${e.toString()}');
    }
  }

  Future<void> _onSettingGetNominalVisibility(
    _,
    Emitter<ThemeState> emit,
  ) async {
    try {
      final preference = await SharedPreferences.getInstance();

      final result = preference.getBool('SHOW_NOMINAL') ?? true;

      emit(state.copyWith(showNominal: result));
    } catch (e) {
      log('ThemeBloc _onAppGetInitialLocale => ${e.toString()}');
    }
  }

  Future<void> _onSettingToggleNominalVisibility(
    _,
    Emitter<ThemeState> emit,
  ) async {
    final preference = await SharedPreferences.getInstance();

    try {
      emit(state.copyWith(
        showNominal: !state.showNominal,
      ));

      await preference.setBool('SHOW_NOMINAL', state.showNominal);
    } catch (e) {
      log('ThemeBloc _onAppToggleLanguage => ${e.toString()}');
    }
  }
}
