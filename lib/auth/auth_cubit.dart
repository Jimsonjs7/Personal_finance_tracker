// lib/auth/auth_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart'; // Import google_sign_in
import 'package:personal_finance_tracker/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn; // Add GoogleSignIn instance

  // Constructor: Initialize with AuthInitial state and provide FirebaseAuth and GoogleSignIn instances
  AuthCubit(this._firebaseAuth, this._googleSignIn) : super(AuthInitial());


  // Existing login, register, logout methods remain here ...
  // (Paste them below this comment if you're replacing the whole file, or just add the googleSignIn method)

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
      await _googleSignIn.signOut(); // Also sign out from Google if signed in via Google
      emit(AuthUnauthenticated()); // Emit unauthenticated state
    } catch (e) {
      // If logout fails (e.g., no internet), keep current state or go to unauthenticated if safe
      emit(AuthFailure('Failed to logout: ${e.toString()}'));
    }
  }

  // Method to check initial authentication status (e.g., when app starts)
  void checkAuthStatus() {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        emit(AuthSuccess(user)); // User is logged in
      } else {
        emit(AuthUnauthenticated()); // User is not logged in
      }
    });
  }

  // >>> NEW METHOD FOR GOOGLE SIGN-IN <<<
  Future<void> signInWithGoogle() async {
    emit(AuthLoading()); // Emit loading state
    try {
      // Begin the Google Sign In Process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in flow
        emit(AuthFailure('Google Sign In cancelled.'));
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential with the access token and ID token
      final firebase_auth.AuthCredential credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final userCredential = await _firebaseAuth.signInWithCredential(credential);

      // If successful, emit AuthSuccess state with the authenticated user
      emit(AuthSuccess(userCredential.user!));
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Catch specific Firebase Authentication exceptions
      String errorMessage = 'Google Sign In Failed: ${e.message}';
      emit(AuthFailure(errorMessage));
    } catch (e) {
      // Catch any other general exceptions
      emit(AuthFailure('An unexpected error occurred during Google Sign In: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    // Clean up resources if necessary
    return super.close();
  }
}