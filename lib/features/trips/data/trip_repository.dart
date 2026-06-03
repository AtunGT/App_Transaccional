import 'dart:convert';
import 'package:app_transaccional/shared/app_config.dart';
import 'package:http/http.dart' as http;
import '../models/trip_model.dart';
import '../../auth/data/auth_repository.dart';

class TripRepository {
  final String baseUrl;

  TripRepository({this.baseUrl = AppConfig.apiBaseUrl});

  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${AuthRepository.token}',
  };

  Future<List<TripModel>> getMyRides() async {
    final response = await http.get(
      Uri.parse('$baseUrl/rides/client/me'),
      headers: _headers,
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => TripModel.fromJson(json)).toList();
    }
    return [];
  }

  Future<bool> createTrip(TripModel trip) async {
    final response = await http.post(
      Uri.parse('$baseUrl/rides'),
      headers: _headers,
      body: jsonEncode(trip.toJson()),
    );
    return response.statusCode == 200 || response.statusCode == 201;
  }

  Future<bool> updateTripStatus(int tripId, int status) async {
    final response = await http.put(
      Uri.parse('$baseUrl/rides/$tripId/status'),
      headers: _headers,
      body: jsonEncode({'status': status}),
    );
    return response.statusCode == 200;
  }
}
