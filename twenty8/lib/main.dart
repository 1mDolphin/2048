import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/celestial_bloc.dart';
import 'bloc/celestial_event.dart';
import 'bloc/celestial_repository.dart';
import 'sensors/sensor_service.dart';
import 'ui/sky_map.dart';

void main() {
  runApp(const SkyMapApp());
}

class SkyMapApp extends StatelessWidget {
  const SkyMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    final celestialRepository = CelestialRepository();
    final sensorService = SensorService();

    return BlocProvider(
      create: (context) => CelestialBloc(
        repository: celestialRepository,
        sensorService: sensorService,
      )..add(LoadCelestialData()),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Sky-map')),
          body: const SkyMap(),
        ),
      ),
    );
  }
}
