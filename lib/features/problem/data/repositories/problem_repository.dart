import '../../../../common/utils/dio_client.dart';
import '../models/problem.dart';

class ProblemRepository {
  final DioClient dioClient;
  static const problemUrl = '/request';

  ProblemRepository(
    this.dioClient,
  );

  Future<void> postProblem(Problem problem) async {
    try {
      await dioClient.sendRequestWithFallback(
        problemUrl,
        {
          //  заголовки, если требуется
        },
        problem.photo,
        data: {
          'latitude': problem.latitude,
          'longitude': problem.longitude,
          'type': problem.type,
          'message': problem.message,
        },
      );

      print('postProblem');
    } catch (e) {
      print('Не удалось отправить обращение: $e');
      rethrow;
    }
  }
}
