import 'package:flutter/material.dart';
import '../../data/trip_repository.dart';
import '../../models/trip_model.dart';

class TripViewModel extends ChangeNotifier {
  final TripRepository _repository = TripRepository();
  List<TripModel> _trips = [];
  bool _isLoading = false;

  List<TripModel> get trips => _trips;
  bool get isLoading => _isLoading;

  Future<void> fetchTrips() async {
    _isLoading = true;
    notifyListeners();
    try {
      _trips = await _repository.getMyRides();
    } catch (_) {
      _trips = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createTrip(TripModel trip) async {
    _isLoading = true;
    notifyListeners();
    try {
      final success = await _repository.createTrip(trip);
      if (success) {
        await fetchTrips();
      }
      return success;
    } catch (_) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> cancelTrip(int tripId) async {
    try {
      final success = await _repository.updateTripStatus(tripId, 4);
      if (success) {
        await fetchTrips();
      }
      return success;
    } catch (_) {
      return false;
    }
  }
}
