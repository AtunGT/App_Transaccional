import 'package:flutter/material.dart';
import '../../models/trip_model.dart';
import '../../data/trip_repository.dart';

class TripViewModel extends ChangeNotifier {
  final TripRepository tripRepository;
  List<TripModel> trips = [];
  bool isLoading = false;

  TripViewModel({required this.tripRepository});

  Future<void> loadTrips() async {
    isLoading = true;
    notifyListeners();
    trips = await tripRepository.getTrips();
    isLoading = false;
    notifyListeners();
  }

  Future<void> addTrip(String origin, String destination, String date) async {
    final newTrip = TripModel(id: DateTime.now().toString(), origin: origin, destination: destination, date: date, status: 'Pendiente');
    await tripRepository.createTrip(newTrip);
    await loadTrips();
  }

  Future<void> deleteTrip(String id) async {
    await tripRepository.deleteTrip(id);
    await loadTrips();
  }
}