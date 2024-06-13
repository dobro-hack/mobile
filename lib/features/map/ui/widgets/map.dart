import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../../../common/theme/app_colors.dart';
import '../../data/models/place.dart';
import '../../data/models/route_response.dart';
import '../../domain/route_state.dart';

class RoutesMap extends ConsumerWidget {
  const RoutesMap({super.key});

  List<Marker> _buildMarkersOnMap(AsyncValue<RouteResponse> asyncRoutes) {
    return asyncRoutes.when(
        data: (RouteResponse data) {
          List<Place> places = [for (var r in data.routes) ...r.places];
          List<Marker> markers = places.map(
            (e) {
              if (e.location.lat > 90 || e.location.lon > 90) {
                return Marker(
                  point: LatLng(55.7522, 37.6156),
                  child: Container(
                    width: 44.h,
                    height: 44.h,
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
                    print('нажали');
                  },
                  child: Container(
                    width: 44.h,
                    height: 44.h,
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
    final asyncRoutes = ref.watch(routesProvider);

    return FlutterMap(
      options: MapOptions(initialCenter: LatLng(53.024263, 158.643504)),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            maxClusterRadius: 45,
            size: const Size(40, 40),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50),
            maxZoom: 15,
            markers: _buildMarkersOnMap(asyncRoutes),
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
