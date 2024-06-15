// import '../../../../common/utils/dio_client.dart';
// import '../models/problem.dart';

// class ProblemRepository {
//   final DioClient dioClient;
//   static const problemUrl = '/message';

//   ProblemRepository(
//     this.dioClient,
//   );

//   Future<void> postProblem(Problem problem) async {
//     try {
//       await dioClient.sendRequestWithFallback(
//         problemUrl,
//         {
//           //  заголовки, если требуется
//         },
//         problem.photo,
//         data: {
//           'latitude': problem.latitude.toString(),
//           'longitude': problem.longitude.toString(),
//           'type': problem.type?.name,
//           'message': problem.message,
//         },
//       );

//       print('postProblem');
//     } catch (e) {
//       print('Не удалось отправить обращение: $e');
//       rethrow;
//     }
//   }
// }

import '../../../../common/utils/dio_client.dart';
import '../models/problem.dart';

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
        'type': problem.type?.name,
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
      print('Не удалось отправить обращение: $e');
      return false;
    }
  }
}
