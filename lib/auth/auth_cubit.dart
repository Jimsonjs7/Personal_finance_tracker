// lib/auth/auth_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:personal_finance_tracker/auth/auth_state.dart'; // Import your AuthState file

class AuthCubit extends Cubit<AuthState> {
  // FirebaseAuth instance to interact with Firebase Authentication
  final firebase_auth.FirebaseAuth _firebaseAuth;

  // Constructor: Initialize with AuthInitial state and provide FirebaseAuth instance
  AuthCubit(this._firebaseAuth) : super(AuthInitial());

  // Method to handle user login
  Future<void> login(String email, String password) async {
    emit(AuthLoading()); // Emit loading state
    try {
      // Attempt to sign in with email and password
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If successful, emit AuthSuccess state with the authenticated user
      emit(AuthSuccess(userCredential.user!));
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Catch specific Firebase Authentication exceptions
      String errorMessage = 'An unknown error occurred.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      } else if (e.code == 'user-disabled') {
        errorMessage = 'This user account has been disabled.';
      }
      // Emit AuthFailure state with the error message
      emit(AuthFailure(errorMessage));
    } catch (e) {
      // Catch any other general exceptions
      emit(AuthFailure(e.toString()));
    }
  }

  // Method to handle new user registration
  Future<void> register(String email, String password) async {
    emit(AuthLoading()); // Emit loading state
    try {
      // Attempt to create a new user with email and password
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If successful, emit AuthSuccess state with the newly created user
      emit(AuthSuccess(userCredential.user!));
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Catch specific Firebase Authentication exceptions
      String errorMessage = 'An unknown error occurred.';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'An account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      }
      // Emit AuthFailure state with the error message
      emit(AuthFailure(errorMessage));
    } catch (e) {
      // Catch any other general exceptions
      emit(AuthFailure(e.toString()));
    }
  }

  // Method to handle user logout
  Future<void> logout() async {
    emit(AuthLoading()); // Emit loading state
    try {
      await _firebaseAuth.signOut(); // Sign out from Firebase
      emit(AuthUnauthenticated()); // Emit unauthenticated state
    } catch (e) {
      // If logout fails (e.g., no internet), keep current state or go to unauthenticated if safe
      emit(AuthFailure('Failed to logout: ${e.toString()}'));
    }
  }

  // Method to check initial authentication status (e.g., when app starts)
  void checkAuthStatus() {
    // Listen to Firebase Auth state changes
    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        emit(AuthSuccess(user)); // User is logged in
      } else {
        emit(AuthUnauthenticated()); // User is not logged in
      }
    });
  }

  @override
  Future<void> close() {
    // Clean up resources if necessary (though authStateChanges is a stream,
    // Bloc/Cubit typically handles stream subscriptions on close)
    return super.close();
  }
}