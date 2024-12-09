import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:psm_incentive/features/app/data/app_repository.dart';
import 'package:psm_incentive/features/app/domain/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final SupabaseClient _supabaseClient;
  final AppRepository _repository;

  AppBloc({
    required SupabaseClient supabaseClient,
    required AppRepository repository,
  })  : _supabaseClient = supabaseClient,
        _repository = repository,
        super(const AppState()) {
    on<CheckUserSession>(_onCheckUserSession);
  }

  void _onCheckUserSession(
    CheckUserSession event,
    Emitter<AppState> emit,
  ) async {
    final currentSession = _supabaseClient.auth.currentSession;

    if (currentSession == null) {
      emit(state.copyWith(status: AppAuthStatus.unauthenticated));
    } else {
      final user = await _repository.getUserData();

      if (user != null) {
        emit(state.copyWith(status: AppAuthStatus.authenticated, user: user));
      } else {
        emit(state.copyWith(status: AppAuthStatus.unauthenticated));
      }
    }
  }
}
