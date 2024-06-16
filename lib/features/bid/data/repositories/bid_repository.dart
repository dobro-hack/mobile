import '../../../../common/logger.dart';
import '../../../../common/utils/dio_client.dart';
import '../models/bid_response.dart';

class BidRepository {
  final DioClient dioClient;
  static const bidUrl = '/request';
  static const personUrl = '/person';

  BidRepository(
    this.dioClient,
  );

  Future<BidResponse> getBids() async {
    try {
      final response = await dioClient.getData(bidUrl);
      if (response.statusCode == 200) {
        return BidResponse.fromJson(response.data);
      } else {
        logger.e('${response.statusCode} Не удалось получить заявки');
        throw Exception('Не удалось получить заявки');
      }
    } catch (e) {
      logger.e('Не удалось получить заявки: $e');
      throw Exception('Не удалось получить заявки');
    }
  }

  Future<void> postBit(Map<String, dynamic> data) async {
    try {
      await dioClient.dio.post(bidUrl, data: data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> postPerson(Map<String, dynamic> data) async {
    try {
      await dioClient.dio.post(personUrl, data: data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
