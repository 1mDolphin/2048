import 'package:flutter_bloc/flutter_bloc.dart';
import 'celestial_event.dart';
import 'celestial_state.dart';
import 'celestial_repository.dart';
import '../sensors/sensor_service.dart';

class CelestialBloc extends Bloc<CelestialEvent, CelestialState> {
  final CelestialRepository repository;
  final SensorService sensorService;

  CelestialBloc({required this.repository, required this.sensorService})
      : super(CelestialInitial()) {
    sensorService.startListening();

    sensorService.accelerometerEvents.listen((event) {
      add(UpdateCelestialData(accelerometerEvent: event));
    });

    sensorService.compassEvents.listen((event) {
      add(UpdateCelestialData(compassEvent: event));
    });
  }

  Stream<CelestialState> mapEventToState(CelestialEvent event) async* {
    if (event is LoadCelestialData) {
      yield CelestialLoading();
      try {
        final objects = await repository.fetchCelestialData();
        yield CelestialLoaded(objects: objects);
      } catch (_) {
        yield CelestialError();
      }
    } else if (event is UpdateCelestialData) {
      if (state is CelestialLoaded) {
        final loadedState = state as CelestialLoaded;
        final updatedObjects = loadedState.objects.map((object) {
          return object;
        }).toList();
        yield CelestialLoaded(objects: updatedObjects);
      }
    }
  }

  @override
  Future<void> close() {
    sensorService.stopListening();
    return super.close();
  }
}
