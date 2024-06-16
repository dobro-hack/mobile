import 'dart:math';

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
    final data = {
      'lat': problem.latitude.toString(),
      'lon': problem.longitude.toString(),
      'type': problem.type?.jsonName,
      'message': problem.message,
      'phone': problem.phone,
    };
    debugPrint('saveLocal /n$data');
    await dioClient.addRequestToQueue(
      problemUrl,
      {
        //  заголовки, если требуется
      },
      problem.photo,
      data: data,
    );
    return true;
  }

  Future<void> repostProblem(LocalProblem problem) async {
    await dioClient.sendPendingProblem(problem.localId);
  }

  Future<bool> postProblem(Problem problem) async {
    try {
      final data = {
        'lat': problem.latitude.toString(),
        'lon': problem.longitude.toString(),
        'type': problem.type?.jsonName,
        'message': problem.message,
        'phone': problem.phone,
      };

      debugPrint('postProblem\n$data');
      return await dioClient.sendRequestWithFallback(
        problemUrl,
        {
          //  заголовки, если требуется
        },
        problem.photo,
        data: data,
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

      final problem = LocalProblem(
        message: request.data?['message'] ?? '',
        location: LocationProblem(
          lat: double.tryParse(request.data?['lat']) ?? 0.0,
          lon: double.tryParse(request.data?['lon']) ?? 0.0,
        ),
        type: problemTypeFromString(request.data?['type']),
        phone: request.data?['phone'] ?? '',
        fileUrl: request.photo?.path,
        localId: request.data?['localId'] ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        savedAt: request.data?['saveAt'] ?? DateTime.now(),
      );
      print(problem.type);

      pendingProblems.add(problem);
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
