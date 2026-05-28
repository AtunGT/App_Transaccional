import 'package:flutter/material.dart';
import '../../data/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;
  bool isLoading = false;
  String? token;

  AuthViewModel({required this.authRepository});

  Future<bool> login(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      token = await authRepository.login(email, password);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      final success = await authRepository.register(name, email, password);
      isLoading = false;
      notifyListeners();
      return success;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void logout() {
    token = null;
    notifyListeners();
  }
}