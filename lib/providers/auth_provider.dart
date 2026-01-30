import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;
  String? _verificationId;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoggedIn => _user != null;
  bool get isLoading => _isLoading;

  AuthProvider() {
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  // 🔹 Send OTP
  Future<void> sendOtp(String phoneNumber) async {
    _isLoading = true;
    notifyListeners();

    final completer = Completer<void>();

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          if (!completer.isCompleted) {
            completer.complete();
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          _isLoading = false;
          notifyListeners();
          if (!completer.isCompleted) {
            completer.completeError(
              Exception(e.message ?? "Verification failed"),
            );
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          _isLoading = false;
          notifyListeners();
          if (!completer.isCompleted) {
            completer.complete();
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
          if (!completer.isCompleted) {
            completer.complete();
          }
        },
      );

      // Wait for one of the callbacks to complete the future
      return completer.future;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      if (!completer.isCompleted) {
        completer.completeError(e);
      }
      rethrow;
    }
  }

  // 🔹 Verify OTP
  Future<void> verifyOtp(String otp) async {
    if (_verificationId == null) {
      throw Exception(
        "Verification ID not found. Please try sending the OTP again.",
      );
    }

    _isLoading = true;
    notifyListeners();

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        throw Exception("The entered OTP is invalid. Please try again.");
      } else {
        throw Exception(e.message ?? "Authentication failed");
      }
    } catch (e) {
      throw Exception("An error occurred: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 🔹 Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
