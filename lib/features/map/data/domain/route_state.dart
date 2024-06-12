import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../base/domain/app_providers.dart';
import '../models/route_info.dart';
import '../models/route_response.dart';
import '../repositories/route_repository.dart';

final routeRepositoryProvider = Provider<RouteRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return RouteRepository(dioClient);
});

final routesProvider = FutureProvider<RouteResponse>((ref) async {
  final repository = ref.read(routeRepositoryProvider);
  return await repository.getRoutes();
});

// final selectedRouteProvider = StateProvider<RouteInfo?>((ref) => null);

// map_notifier.dart

// Состояние карты и выбранного элемента
class MapState {
  final RouteInfo? selectedRoute; // Выбранный маршрут
  // final GoogleMapController? mapController;

  MapState({
    this.selectedRoute,
    // this.mapController,
  });

  MapState copyWith({
    RouteInfo? selectedRoute,
    // GoogleMapController? mapController,
  }) {
    return MapState(
      selectedRoute: selectedRoute ?? this.selectedRoute,
      // mapController: mapController ?? this.mapController,
    );
  }
}

// Notifier для управления состоянием карты и выбором маршрутов
class MapNotifier extends StateNotifier<MapState> {
  MapNotifier() : super(MapState());

  // Установка контроллера карты
  // void setMapController(GoogleMapController controller) {
  //   state = state.copyWith(mapController: controller);
  // }

  // Обработка выбора маршрута
  void selectRoute(RouteInfo route) {
    state = state.copyWith(selectedRoute: route);
    _animateCameraToRoute(route);
  }

  // Анимация карты к определенной точке (маршрут)
  void _animateCameraToRoute(RouteInfo route) {
    // final controller = state.mapController;
    // if (controller != null && route.location != null) {
    //   final LatLng routeLocation =
    //       LatLng(route.location!.latitude, route.location!.longitude);
    //   controller.animateCamera(
    //     CameraUpdate.newLatLngZoom(routeLocation, 14.0),
    //   );
    // }
  }

  // Сброс выбора маршрута
  void clearSelectedRoute() {
    print('clear');
    state = MapState(selectedRoute: null);
  }
}

// Провайдер для MapNotifier
final mapNotifierProvider = StateNotifierProvider<MapNotifier, MapState>((ref) {
  return MapNotifier();
});
