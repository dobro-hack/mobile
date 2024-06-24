import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class MapTileDownloader {
  final int minZoom;
  final int maxZoom;
  final String tileTemplate;

  MapTileDownloader({
    this.minZoom = 0,
    this.maxZoom = 18,
    this.tileTemplate = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  });

  // Функция для загрузки и сохранения тайлов карты
  Future<void> downloadMapTiles(LatLngBounds bounds, String saveName) async {
    debugPrint('downloadMapTiles, ${bounds.center}');
    final directory = await getApplicationDocumentsDirectory();

    for (int zoom = minZoom; zoom <= maxZoom; zoom++) {
      await _downloadTilesForZoom(bounds, zoom, directory.path);
    }
  }

  Future<void> _downloadTilesForZoom(
      LatLngBounds bounds, int zoom, String directory) async {
    debugPrint('_downloadTilesForZoom');
    final nw = _latLngToTile(bounds.northWest, zoom);
    final se = _latLngToTile(bounds.southEast, zoom);

    final width = (se[0] - nw[0] + 1) * 256;
    final height = (se[1] - nw[1] + 1) * 256;
    final mergedImage = img.Image(
      width: width,
      height: height,
    );

    for (int x = nw[0]; x <= se[0]; x++) {
      for (int y = nw[1]; y <= se[1]; y++) {
        final tileUrl = tileTemplate
            .replaceAll('{z}', zoom.toString())
            .replaceAll('{x}', x.toString())
            .replaceAll('{y}', y.toString());

        final tileBytes = await _downloadTile(tileUrl);
        if (tileBytes != null) {
          final tileImage = img.decodeImage(tileBytes);
          if (tileImage != null) {
            final tileUrl = '$directory/{z}/{x}/{y}.png'
                .replaceAll('{z}', zoom.toString())
                .replaceAll('{x}', x.toString())
                .replaceAll('{y}', y.toString());
            final file = File(tileUrl);
            debugPrint(file.path);
            if (!Directory('$directory/$zoom').existsSync()) {
              Directory('$directory/$zoom').createSync();
            }
            if (!Directory('$directory/$zoom/$x').existsSync()) {
              Directory('$directory/$zoom/$x').createSync();
            }
            await file.writeAsBytes(tileBytes);
            //  final filePath = '${directory}/{z}/{x}/{y}.png';
            // Копируем тайл в нужное место на итоговом изображении
            // _copyTileInto(mergedImage, tileImage, x - nw[0], y - nw[1]);
          }
        }
      }
    }

    // final filePath = '${directory.path}/tile_$saveName.png';

    // // Сохраняем итоговое изображение
    // final file = File(filePath);
    // debugPrint(file.path);
    // await file.writeAsBytes(img.encodePng(mergedImage));
  }

  List<int> _latLngToTile(LatLng latLng, int zoom) {
    debugPrint('_latLngToTile');
    final latRad = latLng.latitude * (pi / 180);
    final n = pow(2.0, zoom);
    final x = ((latLng.longitude + 180.0) / 360.0 * n).floor();
    final y =
        ((1.0 - log(tan(latRad) + 1.0 / cos(latRad)) / pi) / 2.0 * n).floor();
    return [x, y];
  }

  // Загрузка тайла по URL
  Future<Uint8List?> _downloadTile(String url) async {
    debugPrint('_downloadTile');
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    return null;
  }

  // Копирование тайла в итоговое изображение
  // void _copyTileInto(
  //     img.Image mergedImage, img.Image tileImage, int xIndex, int yIndex) {
  //   debugPrint('_copyTileInto');
  //   final tileWidth = 256;
  //   final tileHeight = 256;

  //   for (int x = 0; x < tileWidth; x++) {
  //     for (int y = 0; y < tileHeight; y++) {
  //       final pixel = tileImage.getPixel(x, y);
  //       mergedImage.setPixel(
  //           xIndex * tileWidth + x, yIndex * tileHeight + y, pixel);
  //     }
  //   }
  // }
}
