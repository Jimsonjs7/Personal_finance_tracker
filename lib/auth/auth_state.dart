// lib/auth/auth_state.dart

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth; // Alias to avoid conflict with our AuthState

// Base class for all Authentication States
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// Initial state when the app starts or before any authentication action
class AuthInitial extends AuthState {}

// State indicating an authentication operation is in progress
class AuthLoading extends AuthState {}

// State when a user is successfully authenticated
class AuthSuccess extends AuthState {
  final firebase_auth.User user;

  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}

// State when an authentication operation fails
class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);

  @override
  List<Object> get props => [error];
}

// State when the user is not authenticated (logged out)
class AuthUnauthenticated extends AuthState {}