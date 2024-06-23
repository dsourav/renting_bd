import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth firebaseAuth;
  AuthBloc(this.firebaseAuth)
      : super(firebaseAuth.currentUser != null
            ? AuthState.authenticated(firebaseAuth.currentUser!)
            : const AuthState.unauthenticated()) {
    on<AuthUserChanged>(_onUserChanged);
    on<LogoutRequested>(_onLogoutRequested);
    _userSubscription = firebaseAuth
        .authStateChanges()
        .map((firebaseUser) => firebaseUser)
        .listen((user) => add(AuthUserChanged(user)));
  }

  late final StreamSubscription<User?> _userSubscription;

  void _onUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    emit(
      event.user != null ? AuthState.authenticated(event.user!) : const AuthState.unauthenticated(),
    );
  }

  void _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) {
    unawaited(firebaseAuth.signOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
