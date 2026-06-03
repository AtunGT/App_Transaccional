import 'package:app_transaccional/features/trips/presentation/viewmodels/trip_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'request_trip_screen.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  static const _cancelledStatus = 4;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
      Provider.of<TripViewModel>(context, listen: false).fetchTrips();
    });
  }

  String _getStatusText(int status) {
    switch (status) {
      case 1:
        return 'Confirmado';
      case 2:
        return 'En camino';
      case 3:
        return 'En proceso';
      case _cancelledStatus:
        return 'Cancelado';
      case 5:
        return 'Finalizado';
      case 6:
        return 'Publicado';
      default:
        return 'Pendiente';
    }
  }

  Color _getStatusColor(int status, ColorScheme colors) {
    if (status == _cancelledStatus) {
      return colors.errorContainer.withValues(alpha: 0.5);
    }
    return colors.primaryContainer;
  }

  Color _getStatusTextColor(int status, ColorScheme colors) {
    if (status == _cancelledStatus) return colors.error;
    return colors.primary;
  }

  @override
  Widget build(BuildContext context) {
    final tripViewModel = Provider.of<TripViewModel>(context);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mis viajes', style: TextStyle(color: colors.onPrimary)),
        backgroundColor: colors.primary,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: colors.onPrimary),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: tripViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tripViewModel.trips.length,
              itemBuilder: (context, index) {
                final trip = tripViewModel.trips[index];
                return Card(
                  color: colors.surfaceContainerLowest,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.all(16),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: _getStatusColor(trip.status, colors),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _getStatusText(trip.status),
                                style: TextStyle(
                                  color: _getStatusTextColor(
                                    trip.status,
                                    colors,
                                  ),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: colors.outline),
                                  onPressed: () {},
                                ),
                                if (trip.status != _cancelledStatus)
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: colors.error,
                                    ),
                                    onPressed: () async {
                                      await tripViewModel.cancelTrip(trip.id);
                                    },
                                  ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: colors.primary),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Origen',
                                    style: TextStyle(
                                      color: colors.outline,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    trip.originAddress,
                                    style: TextStyle(color: colors.onSurface),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.flag, color: colors.primary),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Destino',
                                    style: TextStyle(
                                      color: colors.outline,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    trip.destinationAddress,
                                    style: TextStyle(color: colors.onSurface),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, color: colors.primary),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fecha y hora',
                                    style: TextStyle(
                                      color: colors.outline,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    [
                                      trip.date,
                                      trip.hour,
                                    ].whereType<String>().join(', '),
                                    style: TextStyle(color: colors.onSurface),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RequestTripScreen()),
          );
        },
        child: Icon(Icons.add, color: colors.onPrimary),
      ),
    );
  }
}
