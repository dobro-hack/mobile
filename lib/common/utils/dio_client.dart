import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../logger.dart';

class DioClient {
  final Dio _dio;
  late Directory _appDocDir;

  DioClient(String baseUrl)
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
          ),
        );

  Dio get dio => _dio;

  Future<void> init() async {
    _appDocDir = await getApplicationDocumentsDirectory();
  }

  Future<Response> getData(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } catch (e) {
      logger.e(e);
      throw Exception('Не удалось получить данные: $e');
    }
  }

  Future<void> addRequestToQueue(
      String url, Map<String, dynamic> headers, File photo) async {
    String photoPath = path.join(
        _appDocDir.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');
    await photo.copy(photoPath);

    Map<String, dynamic> request = {
      'url': url,
      'headers': headers,
      'photoPath': photoPath,
    };

    File requestFile = File(path.join(
        _appDocDir.path, '${DateTime.now().millisecondsSinceEpoch}.json'));
    await requestFile.writeAsString(jsonEncode(request));
  }

  Future<void> sendPendingRequests() async {
    List<FileSystemEntity> files = _appDocDir.listSync();
    for (var file in files) {
      if (file is File && file.path.endsWith('.json')) {
        String content = await file.readAsString();
        Map<String, dynamic> request = jsonDecode(content);

        try {
          File photoFile = File(request['photoPath']);
          FormData formData = FormData.fromMap({
            'photo': await MultipartFile.fromFile(photoFile.path),
          });

          Response response = await _dio.post(
            request['url'],
            data: formData,
            options:
                Options(headers: Map<String, dynamic>.from(request['headers'])),
          );

          if (response.statusCode == 200) {
            await file.delete();
            await photoFile.delete();
          }
        } catch (e) {
          logger.e('Не удалось отправить запрос: $e');
        }
      }
    }
  }

  Future<void> sendRequestWithFallback(
      String url, Map<String, dynamic> headers, File photo) async {
    try {
      FormData formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(photo.path),
      });

      Response response = await _dio.post(
        url,
        data: formData,
        options: Options(headers: headers),
      );

      if (response.statusCode != 200) {
        await addRequestToQueue(url, headers, photo);
      }
    } catch (e) {
      await addRequestToQueue(url, headers, photo);
    }
  }
}
