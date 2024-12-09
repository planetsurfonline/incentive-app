import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginTogglePasswordVisibility>(_onLoginTogglePasswordVisibility);

    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onLoginEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      email: event.email,
      status: Status.initial,
    ));
  }

  void _onLoginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      password: event.password,
      status: Status.initial,
    ));
  }

  void _onLoginTogglePasswordVisibility(
    LoginTogglePasswordVisibility event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      isPasswordHidden: !state.isPasswordHidden,
    ));
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await Supabase.instance.client.auth.signInWithPassword(
        password: state.password,
        email: state.email,
      );
    } on AuthException catch (e) {
      log('LoginBloc _onLoginSubmitted AuthException => ${e.toString()}');

      emit(state.copyWith(
        status: Status.error,
        message: e.message,
      ));
    } catch (e) {
      log('LoginBloc _onLoginSubmitted => ${e.toString()}');

      emit(state.copyWith(
        status: Status.error,
        message: e.toString(),
      ));
    }
  }
}
