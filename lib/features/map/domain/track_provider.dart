import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../data/gpx_service.dart';

part 'track_provider.g.dart';

@riverpod
class TrackProvider extends _$TrackProvider {
  @override
  Future<List<LatLng>> build() async {
    return [];
  }

  Future<void> loadTrackPoints(String gpxAssetPath) async {
    try {
      final trackPoints = await GpxService().parseGpxFile(gpxAssetPath);
      state = AsyncData(trackPoints);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
