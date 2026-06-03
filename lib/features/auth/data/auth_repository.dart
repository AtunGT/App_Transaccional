import 'dart:convert';
import 'dart:io';
import 'package:app_transaccional/shared/app_config.dart';
import 'package:app_transaccional/shared/http_error_logger.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryException implements Exception {
  final String message;

  const AuthRepositoryException(this.message);

  @override
  String toString() => message;
}

class AuthRepository {
  final String baseUrl;
  static String? _token;

  static String? get token => _token;

  static bool get isAuthenticated => _token != null && _token!.isNotEmpty;

  static void logout() {
    _token = null;
  }

  AuthRepository({this.baseUrl = AppConfig.apiBaseUrl});

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final receivedToken = data['token']?.toString();
      if (receivedToken == null || receivedToken.isEmpty) {
        throw const AuthRepositoryException(
          'Login exitoso, pero la API no devolvio token.',
        );
      }
      _token = receivedToken;
      return true;
    }
    HttpErrorLogger.logResponse(
      response,
      operation: 'Login',
      successCodes: const [200],
    );
    throw AuthRepositoryException(
      'Login ${response.statusCode}: ${response.body}',
    );
  }

  Future<bool> register({
    required String name,
    required String lastname,
    required String email,
    String? phoneNumber,
    String? birthdate,
    required String password,
    File? imageFile,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/users'));
    request.fields['name'] = name;
    request.fields['lastname'] = lastname;
    request.fields['email'] = email;
    request.fields['user_type'] = '1';
    request.fields['password'] = password;
    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      request.fields['numberphone'] = phoneNumber;
    }
    if (birthdate != null && birthdate.isNotEmpty) {
      request.fields['birthdate'] = birthdate;
    }

    if (imageFile != null) {
      request.files.add(
        await http.MultipartFile.fromPath('image', imageFile.path),
      );
    }

    final response = await request.send();
    final responseBody = await http.Response.fromStream(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    HttpErrorLogger.logStreamedResponse(
      response,
      responseBody.body,
      operation: 'Registro',
      successCodes: const [200, 201],
    );
    throw AuthRepositoryException(
      'Registro ${response.statusCode}: ${responseBody.body}',
    );
  }
}
