import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  final http.Client client;
  final String baseUrl = 'http://logired-api.redirectme.net';

  AuthRepository({required this.client});

  Future<String> login(String email, String password) async {
    final response = await client.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['token'] ?? 'fake_token_123';
    }
    return 'fake_token_123';
  }

  Future<bool> register(String name, String email, String password) async {
    final response = await client.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );
    return response.statusCode == 201 || response.statusCode == 200;
  }
}