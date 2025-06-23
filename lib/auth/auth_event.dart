// lib/auth/auth_event.dart

import 'package:equatable/equatable.dart';

// Base class for all Authentication Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// Event to request a user login
class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

// Event to request a new user registration
class RegisterRequested extends AuthEvent {
  final String email;
  final String password;

  const RegisterRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

// Event to request a user logout
class LogoutRequested extends AuthEvent {
  const LogoutRequested();

  @override
  List<Object> get props => [];
}

// Event to check the current authentication status (e.g., on app startup)
class AuthStatusRequested extends AuthEvent {
  const AuthStatusRequested();

  @override
  List<Object> get props => [];
}