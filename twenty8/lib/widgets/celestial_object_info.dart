import 'package:flutter/material.dart';
import '../models/celestial_object.dart';

class CelestialObjectInfo extends StatelessWidget {
  final CelestialObject object;

  const CelestialObjectInfo(this.object, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(object.name),
      content: Text(object.description),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
