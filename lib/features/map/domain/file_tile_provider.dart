import 'dart:io';
import 'package:eco/common/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class FileTileProvider extends TileProvider {
  final Directory tileDirectory;
  final String saveName; // ID маршрута

  FileTileProvider(this.tileDirectory, this.saveName);

  @override
  ImageProvider<Object> getImage(
      TileCoordinates coordinates, TileLayer options) {
    final filePath =
        '${tileDirectory.path}/${coordinates.z}/${coordinates.x}/${coordinates.y}.png';
    final file = File(filePath);

    if (file.existsSync()) {
      logger.e(file.path);
      return FileImage(file);
    } else {
      logger.e('file does not exist');
      return AssetImage(
          'assets/no_tile.png'); // Заглушка или ваше собственное изображение
    }
  }
}
