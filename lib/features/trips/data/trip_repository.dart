import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/trip_model.dart';

class TripRepository {
  final http.Client client;
  final String baseUrl = 'http://logired-api.redirectme.net';

  TripRepository({required this.client});

  final List<TripModel> _mockTrips = [
    TripModel(id: '1', origin: 'Aeropuerto Internacional', destination: 'Centro Histórico', date: '29 may 2026, 10:30', status: 'Confirmado'),
    TripModel(id: '2', origin: 'Plaza Mayor', destination: 'Estadio Nacional', date: '30 may 2026, 16:00', status: 'Pendiente'),
  ];

  Future<List<TripModel>> getTrips() async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/trips'));
      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        return List<TripModel>.from(l.map((model) => TripModel.fromJson(model)));
      }
      return _mockTrips;
    } catch (_) { return _mockTrips; }
  }

  Future<void> createTrip(TripModel trip) async {
    try {
      await client.post(Uri.parse('$baseUrl/trips'), body: jsonEncode(trip.toJson()), headers: {'Content-Type': 'application/json'});
    } catch (_) {
      _mockTrips.add(trip);
    }
  }

  Future<void> deleteTrip(String id) async {
    try {
      await client.delete(Uri.parse('$baseUrl/trips/$id'));
    } catch (_) {
      _mockTrips.removeWhere((t) => t.id == id);
    }
  }
}