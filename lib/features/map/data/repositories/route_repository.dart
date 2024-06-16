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
        print(response.statusCode);
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
}
