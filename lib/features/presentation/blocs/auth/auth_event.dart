part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

final class AuthUserChanged extends AuthEvent {
  final User? user;
  const AuthUserChanged(this.user);
}
