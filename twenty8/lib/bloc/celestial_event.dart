import 'package:equatable/equatable.dart';
import 'package:sensors/sensors.dart';
import 'package:flutter_compass/flutter_compass.dart';

abstract class CelestialEvent extends Equatable {
  const CelestialEvent();

  @override
  List<Object?> get props => [];
}

class LoadCelestialData extends CelestialEvent {}

class UpdateCelestialData extends CelestialEvent {
  final AccelerometerEvent? accelerometerEvent;
  final CompassEvent? compassEvent;

  const UpdateCelestialData({this.accelerometerEvent, this.compassEvent});

  @override
  List<Object?> get props => [accelerometerEvent, compassEvent];
}
