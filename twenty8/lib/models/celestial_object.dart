import 'package:equatable/equatable.dart';

class CelestialObject extends Equatable {
  final String name;
  final String description;
  // Add other properties as needed

  const CelestialObject({required this.name, required this.description});

  factory CelestialObject.fromJson(Map<String, dynamic> json) {
    return CelestialObject(
      name: json['name'],
      description: json['description'],
      // Initialize other properties
    );
  }

  @override
  List<Object?> get props => [name, description];
}
