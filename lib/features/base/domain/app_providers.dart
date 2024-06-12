import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/dio_client.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient('https://syomka.tech/api/v1');
});
