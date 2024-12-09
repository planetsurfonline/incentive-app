part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginEmailChanged extends LoginEvent {
  final String email;

  const LoginEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

final class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

final class LoginTogglePasswordVisibility extends LoginEvent {}

final class LoginSubmitted extends LoginEvent {}
