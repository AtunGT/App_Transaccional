import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../trip_viewmodel.dart';

class RequestTripScreen extends StatefulWidget {
  const RequestTripScreen({super.key});

  @override
  State<RequestTripScreen> createState() => _RequestTripScreenState();
}

class _RequestTripScreenState extends State<RequestTripScreen> {
  final originController = TextEditingController();
  final destController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Solicitar Viaje', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingresa los detalles de tu viaje', style: TextStyle(color: colorScheme.outline)),
            const SizedBox(height: 16),
            Card(
              color: colorScheme.surfaceContainerLowest,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: colorScheme.surfaceContainerHighest, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: colorScheme.primaryContainer,
                          child: Icon(Icons.location_on, size: 20, color: colorScheme.primary),
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: TextFormField(controller: originController, decoration: const InputDecoration(labelText: 'Origen'))),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: colorScheme.secondaryContainer,
                          child: Icon(Icons.flag, size: 20, color: colorScheme.secondary),
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: TextFormField(controller: destController, decoration: const InputDecoration(labelText: 'Destino'))),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: colorScheme.tertiaryContainer,
                          child: Icon(Icons.calendar_today, size: 20, color: colorScheme.tertiary),
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: TextFormField(controller: dateController, decoration: const InputDecoration(labelText: 'dd/mm/aaaa --:--'))),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.send),
                      label: const Text('Solicitar Viaje'),
                      onPressed: () async {
                        await context.read<TripViewModel>().addTrip(
                          originController.text,
                          destController.text,
                          dateController.text.isEmpty ? 'Ahora' : dateController.text,
                        );
                        if (context.mounted) Navigator.pop(context);
                      },
                    )
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