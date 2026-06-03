class TripModel {
  final int id;
  final String? originCity;
  final String originAddress;
  final double? originLat;
  final double? originLng;
  final String destinationAddress;
  final double? destinationLat;
  final double? destinationLng;
  final double? distanceKm;
  final String? date;
  final String? hour;
  final int? approxWeight;
  final String? description;
  final int status;

  TripModel({
    required this.id,
    required this.originCity,
    required this.originAddress,
    required this.originLat,
    required this.originLng,
    required this.destinationAddress,
    required this.destinationLat,
    required this.destinationLng,
    required this.distanceKm,
    required this.date,
    required this.hour,
    required this.approxWeight,
    required this.description,
    required this.status,
  });

  factory TripModel.request({
    required String originCity,
    required String originAddress,
    required double originLat,
    required double originLng,
    required String destinationAddress,
    required double destinationLat,
    required double destinationLng,
    required double distanceKm,
    required String date,
    required String hour,
    required int approxWeight,
    required String description,
  }) {
    return TripModel(
      id: 0,
      originCity: originCity,
      originAddress: originAddress,
      originLat: originLat,
      originLng: originLng,
      destinationAddress: destinationAddress,
      destinationLat: destinationLat,
      destinationLng: destinationLng,
      distanceKm: distanceKm,
      date: date,
      hour: hour,
      approxWeight: approxWeight,
      description: description,
      status: 1,
    );
  }

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'] ?? 0,
      originCity: json['origin_city'],
      originAddress: json['origin'] ?? json['origin_address'] ?? '',
      originLat: (json['origin_lat'] as num?)?.toDouble(),
      originLng: (json['origin_lng'] as num?)?.toDouble(),
      destinationAddress:
          json['destination'] ?? json['destination_address'] ?? '',
      destinationLat: (json['destination_lat'] as num?)?.toDouble(),
      destinationLng: (json['destination_lng'] as num?)?.toDouble(),
      distanceKm: (json['distance_km'] as num?)?.toDouble(),
      date: json['date'],
      hour: json['hour'],
      approxWeight: json['approx_weight'],
      description: json['description'],
      status: json['status'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'origin_address': originAddress,
      'destination_address': destinationAddress,
    };

    void addIfPresent(String key, Object? value) {
      if (value == null) return;
      if (value is String && value.isEmpty) return;
      json[key] = value;
    }

    addIfPresent('origin_city', originCity);
    addIfPresent('origin_lat', originLat);
    addIfPresent('origin_lng', originLng);
    addIfPresent('destination_lat', destinationLat);
    addIfPresent('destination_lng', destinationLng);
    addIfPresent('distance_km', distanceKm);
    addIfPresent('date', date);
    addIfPresent('hour', hour);
    addIfPresent('approx_weight', approxWeight);
    addIfPresent('description', description);

    return json;
  }
}
