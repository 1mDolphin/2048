import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sky_painter.dart';
import '../bloc/celestial_bloc.dart';
import '../bloc/celestial_state.dart';
import '../models/celestial_object.dart';
import '../widgets/celestial_object_info.dart';

class SkyMap extends StatelessWidget {
  const SkyMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CelestialBloc, CelestialState>(
      builder: (context, state) {
        if (state is CelestialLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CelestialLoaded) {
          return GestureDetector(
            onTapUp: (details) {
              CelestialObject? tappedObject =
                  findTappedObject(details.localPosition, state.objects);
              if (tappedObject != null) {
                showDialog(
                  context: context,
                  builder: (context) => CelestialObjectInfo(tappedObject),
                );
              }
            },
            child: CustomPaint(
              painter: SkyMapPainter(state.objects),
              child: Container(),
            ),
          );
        } else if (state is CelestialError) {
          return const Center(child: Text('Error loading celestial data'));
        } else {
          return Container();
        }
      },
    );
  }

  CelestialObject? findTappedObject(
      Offset position, List<CelestialObject> objects) {
    // Implement logic to find the tapped object based on position
    return null;
  }
}
