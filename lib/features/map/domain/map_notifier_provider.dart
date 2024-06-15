import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/route_info.dart';
import 'track_provider.dart';

part 'map_notifier_provider.g.dart';

@riverpod
class MapNotifier extends _$MapNotifier {
  MapController? mapController;
  RouteInfo? selectedRoute;

  @override
  MapState build() {
    mapController = MapController();
    return MapState(mapController: mapController);
  }

  void setMapController(MapController controller) {
    mapController = controller;
  }

  Future<void> selectRoute(RouteInfo route) async {
    state = state.copyWith(selectedRoute: route);
    // if (route.gpxAssetPath != null) {
    // Load track points and move camera to the track
    await ref
        .read(trackProviderProvider.notifier)
        .loadTrackPoints('assets/tracks/track.gpx');
    final trackPoints = ref.read(trackProviderProvider).value ?? [];
    _animateCameraToTrack(trackPoints);
    // }
  }

  void clearSelectedRoute() {
    selectedRoute = null;
    ref.read(trackProviderProvider.notifier).state = const AsyncData([]);
    state = MapState(mapController: MapController());
  }

  void _animateCameraToTrack(List<LatLng> trackPoints) {
    if (mapController != null && trackPoints.isNotEmpty) {
      final bounds = _calculateTrackBounds(trackPoints);
      mapController!.fitCamera(CameraFit.bounds(bounds: bounds));
    }
  }

  LatLngBounds _calculateTrackBounds(List<LatLng> trackPoints) {
    double minLat = double.infinity;
    double maxLat = -double.infinity;
    double minLon = double.infinity;
    double maxLon = -double.infinity;

    for (final coord in trackPoints) {
      if (coord.latitude < minLat) minLat = coord.latitude;
      if (coord.latitude > maxLat) maxLat = coord.latitude;
      if (coord.longitude < minLon) minLon = coord.longitude;
      if (coord.longitude > maxLon) maxLon = coord.longitude;
    }

    return LatLngBounds(
      LatLng(minLat, minLon),
      LatLng(maxLat, maxLon),
    );
  }
}

class MapState {
  final RouteInfo? selectedRoute;
  final MapController? mapController;

  MapState({
    this.selectedRoute,
    this.mapController,
  });

  MapState copyWith({
    RouteInfo? selectedRoute,
    MapController? mapController,
  }) {
    return MapState(
      selectedRoute: selectedRoute ?? this.selectedRoute,
      mapController: mapController ?? this.mapController,
    );
  }
}
