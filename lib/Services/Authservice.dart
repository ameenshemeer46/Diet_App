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

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),

      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },

      verificationFailed: (FirebaseAuthException e) {
        _isLoading = false;
        notifyListeners();
        throw Exception(e.message);
      },

      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        _isLoading = false;
        notifyListeners();
      },

      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  // 🔹 Verify OTP
  Future<void> verifyOtp(String otp) async {
    if (_verificationId == null) {
      throw Exception("Verification ID not found");
    }

    _isLoading = true;
    notifyListeners();

    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: otp,
    );

    await _auth.signInWithCredential(credential);

    _isLoading = false;
    notifyListeners();
  }

  // 🔹 Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
