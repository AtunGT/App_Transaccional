import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../auth/presentation/views/login_screen.dart';
import '../trip_viewmodel.dart';
import 'request_trip_screen.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<TripViewModel>().loadTrips());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TripViewModel>();
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.directions_car),
            SizedBox(width: 8),
            Text('Mis Viajes', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
          )
        ],
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final trip = viewModel.trips[index];


                  final isConfirmed = trip.status == 'Confirmado';
                  final statusBg = isConfirmed ? colorScheme.primaryContainer : colorScheme.secondaryContainer;
                  final statusColor = isConfirmed ? colorScheme.onPrimaryContainer : colorScheme.onSecondaryContainer;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    color: colorScheme.surfaceContainerLowest,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: colorScheme.surfaceContainerHighest, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: statusBg,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  trip.status,
                                  style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.edit, size: 20, color: colorScheme.outline),
                                  const SizedBox(width: 16),
                                  GestureDetector(
                                    onTap: () => viewModel.deleteTrip(trip.id),
                                    child: Icon(Icons.delete, size: 20, color: colorScheme.error),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(height: 24, color: colorScheme.surfaceContainerHigh),
                          _buildInfoRow(Icons.location_on, 'Origen', trip.origin, colorScheme.primary, colorScheme),
                          const SizedBox(height: 12),
                          _buildInfoRow(Icons.flag, 'Destino', trip.destination, colorScheme.secondary, colorScheme),
                          const SizedBox(height: 12),
                          _buildInfoRow(Icons.calendar_today, 'Fecha y Hora', trip.date, colorScheme.tertiary, colorScheme),
                        ],
                      ),
                    ),
                  );
                },
                childCount: viewModel.trips.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const RequestTripScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, Color iconColor, ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 12, color: colorScheme.outline)),
              const SizedBox(height: 2),
              Text(value, style: TextStyle(fontSize: 14, color: colorScheme.onSurface)),
            ],
          ),
        )
      ],
    );
  }
}