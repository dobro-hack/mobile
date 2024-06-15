import 'package:eco/features/map/domain/map_notifier_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/logger.dart';
import '../data/repositories/location_repository.dart';
part 'location_provider.g.dart';

@riverpod
class LocationProvider extends _$LocationProvider {
  @override
  LocationState build() {
    return LocationState(isLoading: false);
  }

  Future<void> getCurrentLocation() async {
    state = state.copyWith(isLoading: true);
    try {
      Position position = await LocationRepository().getCurrentLocation();
      LatLng newPoint = LatLng(position.latitude, position.longitude);
      state = state.copyWith(myPoint: newPoint);
      ref.watch(mapNotifierProvider).mapController?.move(newPoint, 13);
    } catch (e) {
      logger.e(e);
    }

    state = state.copyWith(isLoading: false);
  }
}

class LocationState {
  bool? isLoading;
  LatLng? myPoint;

  LocationState({
    this.myPoint,
    this.isLoading,
  });

  LocationState copyWith({
    bool? isLoading,
    LatLng? myPoint,
  }) {
    return LocationState(
      isLoading: isLoading ?? this.isLoading,
      myPoint: myPoint ?? this.myPoint,
    );
  }
}
