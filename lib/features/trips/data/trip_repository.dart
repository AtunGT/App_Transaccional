import 'dart:convert';
import 'package:app_transaccional/shared/app_config.dart';
import 'package:app_transaccional/shared/http_error_logger.dart';
import 'package:http/http.dart' as http;
import '../models/trip_model.dart';
import '../../auth/data/auth_repository.dart';

class TripRepositoryException implements Exception {
  final String message;

  const TripRepositoryException(this.message);

  @override
  String toString() => message;
}

class TripRepository {
  final String baseUrl;

  TripRepository({this.baseUrl = AppConfig.apiBaseUrl});

  Map<String, String> get _headers {
    final token = AuthRepository.token;
    if (token == null || token.isEmpty) {
      throw const TripRepositoryException(
        'No hay token de sesion. Inicia sesion de nuevo.',
      );
    }

    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<List<TripModel>> getMyRides() async {
    final response = await http.get(
      Uri.parse('$baseUrl/rides/client/me'),
      headers: _headers,
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => TripModel.fromJson(json)).toList();
    }
    HttpErrorLogger.logResponse(
      response,
      operation: 'Obtener mis viajes',
      successCodes: const [200],
    );
    return [];
  }

  Future<bool> createTrip(TripModel trip) async {
    final response = await http.post(
      Uri.parse('$baseUrl/rides'),
      headers: _headers,
      body: jsonEncode(trip.toJson()),
    );
    final isSuccess = response.statusCode == 200 || response.statusCode == 201;
    if (!isSuccess) {
      HttpErrorLogger.logResponse(
        response,
        operation: 'Crear viaje',
        successCodes: const [200, 201],
      );
    }
    return isSuccess;
  }

  Future<bool> updateTripStatus(int tripId, int status) async {
    final response = await http.put(
      Uri.parse('$baseUrl/rides/$tripId/status'),
      headers: _headers,
      body: jsonEncode({'status': status}),
    );
    final isSuccess = response.statusCode == 200;
    if (!isSuccess) {
      HttpErrorLogger.logResponse(
        response,
        operation: 'Actualizar estado de viaje',
        successCodes: const [200],
      );
    }
    return isSuccess;
  }
}
