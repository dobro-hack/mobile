import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:xml/xml.dart' as xml;

class GpxService {
// Функция для парсинга GPX строки
  List<LatLng> parseGpxString(String gpxString) {
    final xmlDoc = xml.XmlDocument.parse(gpxString);
    final coordinates = <LatLng>[];

    for (final trackPoint in xmlDoc.findAllElements('trkpt')) {
      final lat = double.parse(trackPoint.getAttribute('lat')!);
      final lon = double.parse(trackPoint.getAttribute('lon')!);
      coordinates.add(LatLng(lat, lon));
    }
    return coordinates;
  }

  // Функция для парсинга GPX файла
  Future<List<LatLng>> parseGpxFile(String assetPath) async {
    final xmlString = await rootBundle.loadString(assetPath);
    return parseGpxString(xmlString);
  }

  // Функция для определения границ по GPX файлу
  Future<LatLngBounds> getBoundsFromGpx(String assetPath) async {
    final coordinates = await parseGpxFile(assetPath);
    double minLat = double.infinity;
    double maxLat = -double.infinity;
    double minLon = double.infinity;
    double maxLon = -double.infinity;

    for (final coord in coordinates) {
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
