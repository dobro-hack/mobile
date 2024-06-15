import 'package:flutter/foundation.dart';

import '../../../../common/logger.dart';
import '../../../../common/utils/dio_client.dart';
import '../models/location_problem.dart';
import '../models/problem.dart';
import '../models/problem_local.dart';
import '../models/problem_response.dart';
import '../models/problem_data.dart';
import '../models/problem_type.dart';

class ProblemRepository {
  final DioClient dioClient;
  static const problemUrl = '/message';

  ProblemRepository(
    this.dioClient,
  );

  Future<bool> saveLocal(Problem problem) async {
    await dioClient.addRequestToQueue(
      problemUrl,
      {
        //  заголовки, если требуется
      },
      problem.photo,
      data: {
        'lat': problem.latitude.toString(),
        'lon': problem.longitude.toString(),
        'type': problem.type?.name, //jsonName ?? 'other',
        'message': problem.message,
        'phone': problem.phone,
      },
    );
    return true;
  }

  Future<bool> postProblem(Problem problem) async {
    try {
      return await dioClient.sendRequestWithFallback(
        problemUrl,
        {
          //  заголовки, если требуется
        },
        problem.photo,
        data: {
          'lat': problem.latitude.toString(),
          'lon': problem.longitude.toString(),
          'type': problem.type?.name,
          'message': problem.message,
          'phone': problem.phone,
        },
      );
    } catch (e) {
      debugPrint('Не удалось отправить обращение: $e');
      return false;
    }
  }

  Future<ProblemResponse> fetchProblemsFromBack() async {
    try {
      final response = await dioClient.getData(problemUrl);
      if (response.statusCode == 200) {
        return ProblemResponse.fromJson(response.data);
      } else {
        logger.e('${response.statusCode} Не удалось получить сообщения');
        throw Exception('Не удалось получить сообщения');
      }
    } catch (e) {
      logger.e('Не удалось получить сообщения: $e');
      throw Exception('Не удалось получить сообщения');
    }
  }

  Future<List<ProblemData>> getPendingRequests() async {
    final pendingRequests = await dioClient.getPendingRequests();
    List<LocalProblem> pendingProblems = [];

    for (var request in pendingRequests) {
      debugPrint(request.toString());
      // Создание объекта LocalProblem из данных в неотправленном запросе
      pendingProblems.add(
        LocalProblem(
          message: request.data?['message'] ?? '',
          location: LocationProblem(
            lat: double.tryParse(request.data?['lat']) ?? 0.0,
            lon: double.tryParse(request.data?['lon']) ?? 0.0,
          ),
          type: ProblemType.other, // замените на реальное значение
          phone: request.data?['phone'] ?? '',
          fileUrl: request.photo?.path,
          localId:
              DateTime.now().millisecondsSinceEpoch.toString(), // уникальный ID
          savedAt: DateTime.now(), // текущее время или время сохранения запроса
        ),
      );
    }

    return pendingProblems;
  }

  Future<List<ProblemData>> getAllProblems() async {
    try {
      // Получаем данные с сервера
      final response = await fetchProblemsFromBack();
      final serverProblems = response.problems;

      // Получаем неотправленные запросы
      final pendingProblems = await getPendingRequests();

      // Объединяем оба списка, приводя все к типу ProblemData
      final allProblems = <ProblemData>[...serverProblems, ...pendingProblems];

      return allProblems;
    } catch (e) {
      logger.e('Ошибка при получении всех проблем: $e');
      throw Exception('Ошибка при получении всех проблем: $e');
    }
  }
}
