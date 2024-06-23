import 'package:dio/dio.dart';

import '../../../common/logger.dart';

class BaseRepository {
  Dio dio = Dio();

  Future<void> sendFBToken(String token) async {
    try {
      await dio.post(
        'https://syomka.tech/api/v1/user',
        data: {'device_id': token},
      );
      logger.i('send $token');
    } catch (e) {
      logger.e(e);
    }
  }
}
