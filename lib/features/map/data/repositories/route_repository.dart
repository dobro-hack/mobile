import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../common/logger.dart';
import '../../../../common/utils/dio_client.dart';
import '../models/route_response.dart';

class RouteRepository {
  final DioClient dioClient;
  static const routesUrl = '/route';

  RouteRepository(
    this.dioClient,
  );

  Future<RouteResponse> getRoutes() async {
    try {
      final response = await dioClient.getData(routesUrl);
      if (response.statusCode == 200) {
        return RouteResponse.fromJson(response.data);
      } else {
        logger.e('${response.statusCode} Не удалось получить маршруты');
        throw Exception('Не удалось получить маршруты');
      }
    } catch (e) {
      logger.e('Не удалось получить маршруты: $e');
      throw Exception('Не удалось получить маршруты');
    }
  }

  void downloadAndSaveTile(String url, String name) async {
    final tileUrl = url.replaceFirst("{s}", "a");

    try {
      final response = await Dio()
          .get(tileUrl, options: Options(responseType: ResponseType.bytes));

      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/tile_$name.png';

        final file = File(filePath);
        await file.writeAsBytes(response.data);
      } else {}
    } catch (e) {}
  }
}
