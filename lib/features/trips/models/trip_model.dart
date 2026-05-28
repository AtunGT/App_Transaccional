class TripModel {
  final String id;
  final String origin;
  final String destination;
  final String date;
  final String status;

  TripModel({required this.id, required this.origin, required this.destination, required this.date, required this.status});

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'].toString(),
      origin: json['origin'] ?? '',
      destination: json['destination'] ?? '',
      date: json['date'] ?? '',
      status: json['status'] ?? 'Pendiente',
    );
  }

  Map<String, dynamic> toJson() => {
    'origin': origin,
    'destination': destination,
    'date': date,
    'status': status,
  };
}