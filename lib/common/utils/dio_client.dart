// import 'package:dio/dio.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:convert';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

// import '../logger.dart';

// class DioClient {
//   final Dio _dio;
//   late Directory _appDocDir;

//   DioClient(String baseUrl)
//       : _dio = Dio(
//           BaseOptions(
//             baseUrl: baseUrl,
//           ),
//         ) {
//     init();
//   }

//   Dio get dio => _dio;

//   Future<void> init() async {
//     _appDocDir = await getApplicationDocumentsDirectory();
//   }

//   Future<Response> getData(String endpoint) async {
//     try {
//       return await _dio.get(endpoint);
//     } catch (e) {
//       logger.e(e);
//       throw Exception('Не удалось получить данные: $e');
//     }
//   }

//   Future<void> addRequestToQueue(
//       String url, Map<String, dynamic> headers, XFile? photo,
//       {Map<String, dynamic>? data}) async {
//     try {
//       if (photo != null) {
//         String photoPath = path.join(
//             _appDocDir.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');
//         // Сохранение выбранного изображения
//         await photo.saveTo(photoPath);
//       }

//       Map<String, dynamic> request = {
//         'url': url,
//         'headers': headers,
//         'photoPath': photo?.path, // Используем путь из XFile
//         'data': data,
//       };

//       File requestFile = File(path.join(
//           _appDocDir.path, '${DateTime.now().millisecondsSinceEpoch}.json'));
//       await requestFile.writeAsString(jsonEncode(request));
//     } catch (e) {
//       logger.e('Failed to add request to queue: $e');
//       throw Exception('Failed to add request to queue: $e');
//     }
//   }

//   Future<void> sendPendingRequests() async {
//     List<FileSystemEntity> files = _appDocDir.listSync();
//     for (var file in files) {
//       if (file is File && file.path.endsWith('.json')) {
//         String content = await file.readAsString();
//         Map<String, dynamic> request = jsonDecode(content);

//         try {
//           File photoFile = File(request['photoPath']);
//           FormData formData = FormData.fromMap({
//             'photo': await MultipartFile.fromFile(photoFile.path),
//           });

//           Response response = await _dio.post(
//             request['url'],
//             data: formData,
//             options:
//                 Options(headers: Map<String, dynamic>.from(request['headers'])),
//           );

//           if (response.statusCode == 200) {
//             await file.delete();
//             await photoFile.delete();
//           }
//           logger.i('Отправлено, код ${response.statusCode}\nformData$formData');
//         } catch (e) {
//           logger.e('Не удалось отправить запрос: $e');
//         }
//       }
//     }
//   }

//   Future<void> sendRequestWithFallback(
//       String url, Map<String, dynamic> headers, XFile? photo,
//       {Map<String, dynamic>? data}) async {
//     try {
//       FormData formData = FormData();
//       if (photo != null) {
//         formData.files
//             .add(MapEntry('photo', await MultipartFile.fromFile(photo.path)));
//       }
//       if (data != null) {
//         for (var entry in data.entries) {
//           formData.fields.add(MapEntry(entry.key, entry.value.toString()));
//         }
//       }

//       Response response = await _dio.post(
//         url,
//         data: formData,
//         options: Options(headers: headers),
//       );
//       logger.i(
//           'sendRequestWithFallback response.statusCode ${response.statusCode}');

//       if (response.statusCode != 200) {
//         await addRequestToQueue(url, headers, photo, data: data);
//       }
//     } catch (e) {
//       logger.e('sendRequestWithFallback $e');
//       await addRequestToQueue(url, headers, photo, data: data);
//     }
//   }
// }

import 'package:dio/dio.dart';
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

  Future<void> sendPendingRequests() async {
    List<FileSystemEntity> files = _appDocDir.listSync();
    for (var file in files) {
      if (file is File && file.path.endsWith('.json')) {
        String content = await file.readAsString();
        Map<String, dynamic> request = jsonDecode(content);

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
          logger.i('Отправлено, код ${response.statusCode}\nformData$formData');
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
      print('response.statusCode ${response.statusCode}');
      if (response.statusCode != 200) {
        await addRequestToQueue(url, headers, photo, data: data);
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
}
