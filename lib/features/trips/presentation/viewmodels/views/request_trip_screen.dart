import 'package:app_transaccional/features/trips/models/trip_model.dart';
import 'package:app_transaccional/features/trips/presentation/viewmodels/trip_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestTripScreen extends StatefulWidget {
  const RequestTripScreen({super.key});

  @override
  State<RequestTripScreen> createState() => _RequestTripScreenState();
}

class _RequestTripScreenState extends State<RequestTripScreen> {
  final _originCityController = TextEditingController();
  final _originAddressController = TextEditingController();
  final _originLatController = TextEditingController();
  final _originLngController = TextEditingController();
  final _destinationAddressController = TextEditingController();
  final _destinationLatController = TextEditingController();
  final _destinationLngController = TextEditingController();
  final _distanceController = TextEditingController();
  final _dateController = TextEditingController();
  final _hourController = TextEditingController();
  final _weightController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _originCityController.dispose();
    _originAddressController.dispose();
    _originLatController.dispose();
    _originLngController.dispose();
    _destinationAddressController.dispose();
    _destinationLatController.dispose();
    _destinationLngController.dispose();
    _distanceController.dispose();
    _dateController.dispose();
    _hourController.dispose();
    _weightController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  double? _readDouble(TextEditingController controller) {
    return double.tryParse(controller.text.trim());
  }

  int? _readInt(TextEditingController controller) {
    return int.tryParse(controller.text.trim());
  }

  bool get _hasRequiredTextFields {
    return _originCityController.text.trim().isNotEmpty &&
        _originAddressController.text.trim().isNotEmpty &&
        _destinationAddressController.text.trim().isNotEmpty &&
        _dateController.text.trim().isNotEmpty &&
        _hourController.text.trim().isNotEmpty &&
        _descriptionController.text.trim().isNotEmpty;
  }

  TripModel? _buildTrip() {
    final originLat = _readDouble(_originLatController);
    final originLng = _readDouble(_originLngController);
    final destinationLat = _readDouble(_destinationLatController);
    final destinationLng = _readDouble(_destinationLngController);
    final distanceKm = _readDouble(_distanceController);
    final approxWeight = _readInt(_weightController);

    if (!_hasRequiredTextFields ||
        originLat == null ||
        originLng == null ||
        destinationLat == null ||
        destinationLng == null ||
        distanceKm == null ||
        approxWeight == null) {
      return null;
    }

    return TripModel.request(
      originCity: _originCityController.text.trim(),
      originAddress: _originAddressController.text.trim(),
      originLat: originLat,
      originLng: originLng,
      destinationAddress: _destinationAddressController.text.trim(),
      destinationLat: destinationLat,
      destinationLng: destinationLng,
      distanceKm: distanceKm,
      date: _dateController.text.trim(),
      hour: _hourController.text.trim(),
      approxWeight: approxWeight,
      description: _descriptionController.text.trim(),
    );
  }

  Widget _tripField({
    required IconData icon,
    required ColorScheme colors,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: colors.primaryContainer,
          child: Icon(icon, color: colors.primary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(hintText: hintText),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripViewModel = Provider.of<TripViewModel>(context);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Solicitar viaje',
          style: TextStyle(color: colors.onPrimary),
        ),
        backgroundColor: colors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.onPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingresa los detalles de tu viaje',
              style: TextStyle(color: colors.outline, fontSize: 14),
            ),
            const SizedBox(height: 16),
            Card(
              color: colors.surfaceContainerLowest,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _tripField(
                      icon: Icons.location_city,
                      colors: colors,
                      controller: _originCityController,
                      hintText: 'Ciudad de origen',
                    ),
                    const SizedBox(height: 16),
                    _tripField(
                      icon: Icons.location_on,
                      colors: colors,
                      controller: _originAddressController,
                      hintText: 'Dirección de origen',
                    ),
                    const SizedBox(height: 16),
                    _tripField(
                      icon: Icons.my_location,
                      colors: colors,
                      controller: _originLatController,
                      hintText: 'Latitud de origen',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    _tripField(
                      icon: Icons.explore,
                      colors: colors,
                      controller: _originLngController,
                      hintText: 'Longitud de origen',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    _tripField(
                      icon: Icons.flag,
                      colors: colors,
                      controller: _destinationAddressController,
                      hintText: 'Dirección de destino',
                    ),
                    const SizedBox(height: 16),
                    _tripField(
                      icon: Icons.place,
                      colors: colors,
                      controller: _destinationLatController,
                      hintText: 'Latitud de destino',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    _tripField(
                      icon: Icons.assistant_direction,
                      colors: colors,
                      controller: _destinationLngController,
                      hintText: 'Longitud de destino',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    _tripField(
                      icon: Icons.straighten,
                      colors: colors,
                      controller: _distanceController,
                      hintText: 'Distancia en km',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    _tripField(
                      icon: Icons.calendar_today,
                      colors: colors,
                      controller: _dateController,
                      hintText: 'Fecha aaaa-mm-dd',
                      keyboardType: TextInputType.datetime,
                    ),
                    const SizedBox(height: 16),
                    _tripField(
                      icon: Icons.schedule,
                      colors: colors,
                      controller: _hourController,
                      hintText: 'Hora hh:mm',
                      keyboardType: TextInputType.datetime,
                    ),
                    const SizedBox(height: 16),
                    _tripField(
                      icon: Icons.inventory_2,
                      colors: colors,
                      controller: _weightController,
                      hintText: 'Peso aproximado',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    _tripField(
                      icon: Icons.description,
                      colors: colors,
                      controller: _descriptionController,
                      hintText: 'Descripción',
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: tripViewModel.isLoading
                            ? null
                            : () async {
                                final trip = _buildTrip();
                                if (trip == null) {
                                  _showMessage(
                                    'Completa todos los datos del viaje',
                                  );
                                  return;
                                }

                                final success = await tripViewModel.createTrip(
                                  trip,
                                );
                                if (!context.mounted) return;
                                if (!success) {
                                  _showMessage('No se pudo solicitar el viaje');
                                  return;
                                }
                                Navigator.pop(context);
                              },
                        icon: Icon(Icons.send, color: colors.onPrimary),
                        label: Text(
                          'Solicitar viaje',
                          style: TextStyle(
                            color: colors.onPrimary,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
