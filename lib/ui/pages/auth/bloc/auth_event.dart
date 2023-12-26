part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthIsRegisterEvent extends AuthEvent {
  const AuthIsRegisterEvent();
}

final class AuthIsLoginEvent extends AuthEvent {
  const AuthIsLoginEvent();
}

final class DoLoginEvent extends AuthEvent {
  final String email;
  final String password;

  const DoLoginEvent({
    required this.email,
    required this.password,
  });
}

final class ValidateLoginEvent extends AuthEvent {
  final String email;
  final String password;

  const ValidateLoginEvent({
    required this.email,
    required this.password,
  });
}

final class DoRegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const DoRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

final class ValidateRegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const ValidateRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

final class SetVariableAuth extends AuthEvent {
  final AuthState state;

  SetVariableAuth(this.state);
}
