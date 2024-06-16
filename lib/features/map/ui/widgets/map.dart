import 'package:eco/features/map/domain/location_provider.dart';
import 'package:eco/features/map/domain/track_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../../../common/theme/app_colors.dart';
import '../../data/models/place.dart';
import '../../data/models/route_response.dart';
import '../../domain/map_notifier_provider.dart';
import '../../domain/routes_provider.dart';
import 'place_bottom_modal.dart';

class RoutesMap extends ConsumerWidget {
  const RoutesMap({super.key});

  List<Marker> _buildMarkersOnMap(
      AsyncValue<RouteResponse> asyncRoutes, BuildContext context) {
    return asyncRoutes.when(
        data: (RouteResponse data) {
          List<Place> places = [for (var r in data.routes) ...r.places ?? []];
          List<Marker> markers = places.map(
            (e) {
              if (e.location.lat > 90 || e.location.lon > 90) {
                return Marker(
                  point: LatLng(55.7522, 37.6156),
                  child: Container(
                    width: 64.h,
                    height: 64.h,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3.h,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                );
              }
              return Marker(
                point: LatLng(e.location.lat, e.location.lon),
                child: GestureDetector(
                  onTap: () {
                    debugPrint('нажали');
                    showPlaceModal(context, e);
                  },
                  child: Container(
                    width: 64.h,
                    height: 64.h,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3.h,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList();
          return markers;
        },
        error: (Object error, StackTrace stackTrace) => [],
        loading: () => []);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRoutes = ref.watch(routesProviderProvider);
    final trackPointsAsync = ref.watch(trackProviderProvider);

    return FlutterMap(
      mapController: ref.watch(mapNotifierProvider).mapController,
      options: MapOptions(
        initialCenter: LatLng(
          // 53.024263,
          // 158.643504,
          55.54407582912374,
          37.61409759521485,
        ),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        MarkerLayer(markers: [
          if (ref.watch(locationProviderProvider).myPoint != null)
            Marker(
              width: 20.0,
              height: 20.0,
              point: ref.watch(locationProviderProvider).myPoint!,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3.w,
                      color: AppColors.white,
                    ),
                    color: AppColors.green),
              ),
            ),
        ]),
        if (ref.watch(mapNotifierProvider).selectedRoute != null)
          PolylineLayer(
            polylines: trackPointsAsync.when(
              error: (error, stackTrace) => [],
              loading: () => [],
              data: (List<LatLng> trackPoints) {
                return [
                  Polyline(
                    points: trackPoints,
                    strokeWidth: 4.0,
                    color: Colors.blue,
                  ),
                ];
              },
            ),
          ),
        MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            maxClusterRadius: 45,
            size: const Size(40, 40),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50),
            maxZoom: 15,
            markers: _buildMarkersOnMap(asyncRoutes, context),
            builder: (context, markers) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Center(
                  child: Text(
                    markers.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
