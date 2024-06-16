import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
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
        ) {
    init();
  }

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
      String url, Map<String, dynamic> headers, XFile? photo,
      {Map<String, dynamic>? data}) async {
    try {
      String? photoPath;
      if (photo != null) {
        photoPath = path.join(
            _appDocDir.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');
        await photo.saveTo(photoPath);
      }

      Map<String, dynamic> request = {
        'url': url,
        'headers': headers,
        'photoPath': photoPath, // Используем путь из XFile
        'data': data,
      };

      File requestFile = File(path.join(
          _appDocDir.path, '${DateTime.now().millisecondsSinceEpoch}.json'));
      await requestFile.writeAsString(jsonEncode(request));
    } catch (e) {
      logger.e('Failed to add request to queue: $e');
      throw Exception('Failed to add request to queue: $e');
    }
  }

  Future<void> sendPendingProblem(String localId) async {
    List<FileSystemEntity> files = _appDocDir.listSync();
    for (var file in files) {
      if (file is File && file.path.endsWith('.json')) {
        String content = await file.readAsString();
        Map<String, dynamic> request = jsonDecode(content);
        print(request);
        try {
          FormData formData = FormData();
          if (request['photoPath'] != null) {
            File photoFile = File(request['photoPath']);
            formData.files.add(
                MapEntry('file', await MultipartFile.fromFile(photoFile.path)));
          }
          if (request['data'] != null) {
            for (var entry
                in Map<String, dynamic>.from(request['data']).entries) {
              formData.fields.add(MapEntry(entry.key, entry.value.toString()));
            }
          }

          Response response = await _dio.post(
            request['url'],
            data: formData,
            options:
                Options(headers: Map<String, dynamic>.from(request['headers'])),
          );

          if (response.statusCode == 200) {
            await file.delete();
            if (request['photoPath'] != null) {
              File photoFile = File(request['photoPath']);
              await photoFile.delete();
            }
          }
          logger.i(
              'Отправлено $request, код ${response.statusCode}\nformData$formData');
        } catch (e) {
          logger.e('Не удалось отправить запрос: $e');
        }
      }
    }
  }

  Future<bool> sendRequestWithFallback(
      String url, Map<String, dynamic> headers, XFile? photo,
      {Map<String, dynamic>? data}) async {
    try {
      FormData formData = FormData();
      if (photo != null) {
        formData.files
            .add(MapEntry('file', await MultipartFile.fromFile(photo.path)));
      }
      if (data != null) {
        for (var entry in data.entries) {
          formData.fields.add(MapEntry(entry.key, entry.value.toString()));
        }
      }

      Response response = await _dio.post(
        url,
        data: formData,
        options: Options(headers: headers),
      );
      debugPrint('response.statusCode ${response.statusCode}');
      if (response.statusCode != 200) {
        final Map<String, dynamic> adding = {
          'localId': DateTime.now().millisecondsSinceEpoch.toString(),
          'saveAt': DateTime.now(),
        };
        final newData = data ?? {};
        newData.addAll(adding);
        await addRequestToQueue(url, headers, photo, data: newData);
        return false;
      } else {
        return true;
      }
    } catch (e) {
      logger.e('sendRequestWithFallback $e');
      await addRequestToQueue(url, headers, photo, data: data);
      return false;
    }
  }

  Future<List<LocalRequest>> getPendingRequests() async {
    List<LocalRequest> pendingRequests = [];
    try {
      // Получаем список файлов в локальной директории
      List<FileSystemEntity> files = _appDocDir.listSync();

      for (var file in files) {
        if (file is File && file.path.endsWith('.json')) {
          // Читаем содержимое файла
          String content = await file.readAsString();
          Map<String, dynamic> requestJson = jsonDecode(content);

          // Преобразуем JSON в LocalRequest
          LocalRequest localRequest = LocalRequest.fromJson(requestJson);
          pendingRequests.add(localRequest);
        }
      }
    } catch (e) {
      // Логируем ошибку
      logger.e('Failed to retrieve pending requests: $e');
    }

    return pendingRequests;
  }
}

class LocalRequest {
  final String url;
  final Map<String, dynamic> headers;
  final XFile? photo;
  final Map<String, dynamic>? data;

  LocalRequest({
    required this.url,
    required this.headers,
    this.photo,
    this.data,
  });

  // Метод для создания LocalRequest из JSON-данных
  factory LocalRequest.fromJson(Map<String, dynamic> json) {
    return LocalRequest(
      url: json['url'] as String,
      headers: Map<String, dynamic>.from(json['headers']),
      photo: json['photoPath'] != null ? XFile(json['photoPath']) : null,
      data:
          json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
    );
  }

  // Метод для преобразования LocalRequest в JSON
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'headers': headers,
      'photoPath': photo?.path,
      'data': data,
    };
  }

  @override
  String toString() {
    return data.toString();
  }
}
