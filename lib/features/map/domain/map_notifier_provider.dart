import 'dart:io';
import 'dart:ui';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eco/common/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/map_tile_downloader.dart';
import '../data/models/route_info.dart';
import '../data/repositories/location_repository.dart';
import '../data/repositories/route_manager.dart';
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
    selectedRoute = route;
    bool isSaved = await RouteManager.isRouteSaved(route);
    state = state.copyWith(
      selectedRoute: route,
      downloadStatus: isSaved ? DownloadStatus.success : DownloadStatus.initial,
    );

    await ref
        .read(trackProviderProvider.notifier)
        .loadTrackPoints('assets/tracks/track.gpx');
    final trackPoints = ref.read(trackProviderProvider).value ?? [];
    _animateCameraToTrack(trackPoints);
    // Проверяем состояние интернет-соединения
    var connectivityResult = await Connectivity().checkConnectivity();
    bool isConnected = connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);

    if (!isConnected) {
      final directory = await getApplicationDocumentsDirectory();
      void _listDirectoryContents(Directory dir) {
        try {
          dir.list(recursive: true).listen((FileSystemEntity entity) {
            print(entity.path);
          });
        } catch (e) {
          print('Ошибка при чтении содержимого директории: $e');
        }
      }

// Получаем список файлов и папок в директории
      List<FileSystemEntity> contents = directory.listSync();

      // Выводим содержимое в консоль
      print('Содержимое директории ${directory.path}:');
      _listDirectoryContents(directory);

      state = state.copyWith(directory: directory.path);
    }
    state = state.copyWith(isConnect: isConnected);
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

  int calculateZoom(LatLngBounds bounds, Size screenSize) {
    final double latFraction = (bounds.north - bounds.south) / 180.0;
    final double lngFraction = (bounds.east - bounds.west) / 360.0;

    final double latZoom = _zoom(latFraction, screenSize.height);
    final double lngZoom = _zoom(lngFraction, screenSize.width);

    final double zoom = latZoom < lngZoom ? latZoom : lngZoom;

    return zoom.toInt();
  }

  double _zoom(double fraction, double screenSize) {
    double logBase(num x, num base) => log(x) / log(base);
    double log2(num x) => logBase(x, 2);
    return (log2(1 / fraction) + log2(screenSize / 256.0)).toDouble();
  }

// ДОБАВИТЬ СКАЧИВАНИЕ ОСТАЛЬНОЙ ИНФЫ
  Future<bool> downloadRoute(Size screenSize) async {
    state = state.copyWith(downloadStatus: DownloadStatus.loading);
    debugPrint('начинаем скачивать');
    try {
      // SOON
      // final trackPoints = ref.read(trackProviderProvider).value ?? [];

      // final bounds = _calculateTrackBounds(trackPoints);
      // // int zoom = calculateZoom(bounds, screenSize);
      // final downloader = MapTileDownloader(
      //     minZoom: 11, maxZoom: 11); // Указываем нужный диапазон зумов
      // await downloader.downloadMapTiles(
      //     bounds, selectedRoute?.id.toString() ?? '0');
      if (selectedRoute != null) {
        await Future.delayed(Duration(milliseconds: 600));
        await RouteManager.saveSelectedRoute(selectedRoute!);
      }

      debugPrint('закончили скачивать');
      state = state.copyWith(downloadStatus: DownloadStatus.success);
      return true;
    } catch (e) {
      logger.e(e);
      state = state.copyWith(downloadStatus: DownloadStatus.error);
      return false;
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
// Добавляем отступы в 16 пикселей к границам трека
    final double paddingLat = 0.00014492753623 * 64;
    final double paddingLon = 0.00014492753623 * 64;

    minLat -= paddingLat;
    maxLat += paddingLat;
    minLon -= paddingLon;
    maxLon += paddingLon;
    return LatLngBounds(
      LatLng(minLat, minLon),
      LatLng(maxLat, maxLon),
    );
  }

  // Future<void> getCurrentLocation() async {
  //   try {
  //     Position position = await LocationRepository().getCurrentLocation();
  //     LatLng newPoint = LatLng(position.latitude, position.longitude);
  //     state = state.copyWith(myPoint: newPoint);
  //     mapController?.move(newPoint, 13);
  //   } catch (e) {
  //     logger.e(e);
  //   }
  // }
}

enum DownloadStatus {
  initial,
  loading,
  success,
  error,
}

class MapState {
  final RouteInfo? selectedRoute;
  final MapController? mapController;
  final bool? isConnect;
  final String? directory;
  final DownloadStatus? downloadStatus;

  MapState({
    this.selectedRoute,
    this.mapController,
    this.isConnect,
    this.directory,
    this.downloadStatus,
  });

  MapState copyWith({
    RouteInfo? selectedRoute,
    MapController? mapController,
    bool? isConnect,
    String? directory,
    DownloadStatus? downloadStatus,
  }) {
    return MapState(
      selectedRoute: selectedRoute ?? this.selectedRoute,
      mapController: mapController ?? this.mapController,
      isConnect: isConnect ?? this.isConnect,
      directory: directory ?? this.directory,
      downloadStatus: downloadStatus ?? this.downloadStatus,
    );
  }
}
