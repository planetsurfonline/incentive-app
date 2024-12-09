part of 'login_bloc.dart';

final class LoginState extends Equatable {
  final Status status;
  final String message;
  final String email;
  final String password;
  final bool isPasswordHidden;

  const LoginState({
    this.status = Status.initial,
    this.email = '',
    this.password = '',
    this.message = '',
    this.isPasswordHidden = true,
  });

  LoginState copyWith({
    Status status = Status.initial,
    String? email,
    String? password,
    String? message,
    bool? isPasswordHidden,
  }) {
    return LoginState(
      status: status,
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        password,
        message,
        isPasswordHidden,
      ];
}
