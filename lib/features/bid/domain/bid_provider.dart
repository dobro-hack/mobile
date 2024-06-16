import 'dart:math';

import 'package:eco/features/base/domain/app_providers.dart';
import 'package:eco/features/bid/data/models/bid.dart';
import 'package:eco/features/map/domain/map_notifier_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../common/logger.dart';
import '../data/repositories/bid_repository.dart';

part 'bid_provider.g.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final selectedDateProvider =
    StateNotifierProvider<SelectedDateNotifier, DateTime?>((ref) {
  return SelectedDateNotifier();
});

class SelectedDateNotifier extends StateNotifier<DateTime?> {
  SelectedDateNotifier() : super(null);

  void setDate(DateTime date) {
    state = date;
  }
}

@riverpod
class NumberOfGuests extends _$NumberOfGuests {
  @override
  int build() => 1;

  void setNumberOfGuests(int count) {
    state = count;
  }
}

@riverpod
Future<bool> dateAvailability(DateAvailabilityRef ref, DateTime date) async {
  debugPrint(ref.read(numberOfGuestsProvider).toString());
  // обращение к серверу
  print('CHECK DATA');
  await Future.delayed(const Duration(milliseconds: 600));
  return ref.read(numberOfGuestsProvider) < 7;
  // return true;
  // return false;
}

@riverpod
class BookingStatus extends _$BookingStatus {
  @override
  AsyncValue<bool> build() => const AsyncValue.data(false);

  Future<void> sendPerson(String uuid, Map<String, dynamic> data) async {
    final resData = data;
    resData.addAll({
      'request_id': uuid,
      "last_name": "Иванов",
      "Sitizen": "РФ",
      "Region": "Москва",
      "Gender": "man",
      "Phone": "79131313",
      "Email": "ru@ru.ru",
      "is_leader": false,
    });
    final bidRepository = BidRepository(ref.read(dioClientProvider));
    await bidRepository.postPerson(resData);
  }

  Future<void> submitBooking(
      String uuid, List<Map<String, dynamic>> persons) async {
    state = const AsyncValue.loading();
    try {
      // final dio = ref.read(dioProvider);
      final selectedDate = ref.read(selectedDateProvider);
      // final numberOfGuests = ref.read(numberOfGuestsProvider);
      debugPrint(selectedDate.toString());
      if (selectedDate == null) {
        throw Exception('Дата не выбрана');
      }
      Map<String, dynamic> data = {
        'route_id': ref.read(mapNotifierProvider).selectedRoute?.id,
        'quantity': ref.read(numberOfGuestsProvider),
        'date_start': ref.read(selectedDateProvider).toString(),
        'request_id': uuid,
      };
      final bidRepository = BidRepository(ref.read(dioClientProvider));
      await bidRepository.postBit(data);
      for (var person in persons) {
        await sendPerson(uuid, person);
      }

      await Future.delayed(const Duration(milliseconds: 600));
      state = const AsyncValue.data(true);
    } catch (e) {
      state = const AsyncValue.data(false); // AsyncValue.error(e);
    }
  }
}

final allBidsProvider = FutureProvider<List<Bid>>((ref) async {
  final repository = BidRepository(ref.read(dioClientProvider));
  final data = await repository.getBids();
  return data.bids;
});
