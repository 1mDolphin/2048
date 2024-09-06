import 'package:sensors/sensors.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:async';

class SensorService {
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  StreamSubscription<CompassEvent>? _compassSubscription;

  Stream<AccelerometerEvent> get accelerometerEvents => accelerometerEvents;
  Stream<CompassEvent> get compassEvents => FlutterCompass.events!;

  void startListening() {
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      // Handle accelerometer data
      print('Accelerometer: $event');
    });
    _compassSubscription = FlutterCompass.events!.listen((CompassEvent event) {
      // Handle compass data
      print('Compass: $event');
    });
  }

  void stopListening() {
    _accelerometerSubscription?.cancel();
    _compassSubscription?.cancel();
  }
}
