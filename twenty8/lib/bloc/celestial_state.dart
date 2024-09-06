import 'package:equatable/equatable.dart';
import '../models/celestial_object.dart';

abstract class CelestialState extends Equatable {
  const CelestialState();

  @override
  List<Object> get props => [];
}

class CelestialInitial extends CelestialState {}

class CelestialLoading extends CelestialState {}

class CelestialLoaded extends CelestialState {
  final List<CelestialObject> objects;

  const CelestialLoaded({required this.objects});

  @override
  List<Object> get props => [objects];
}

class CelestialError extends CelestialState {}
