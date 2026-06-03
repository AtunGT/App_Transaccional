import 'dart:io';
import 'package:flutter/material.dart';
import '../../data/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _repository = AuthRepository();
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      return await _repository.login(email, password);
    } catch (error) {
      _errorMessage = error.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> register({
    required String name,
    required String lastname,
    required String email,
    required String phoneNumber,
    required String birthdate,
    required String password,
    File? imageFile,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      return await _repository.register(
        name: name,
        lastname: lastname,
        email: email,
        phoneNumber: phoneNumber,
        birthdate: birthdate,
        password: password,
        imageFile: imageFile,
      );
    } catch (error) {
      _errorMessage = error.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
