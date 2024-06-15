import 'dart:math';

import 'package:eco/features/base/domain/app_providers.dart';
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
  return Random().nextBool();
  // return true;
  // return false;
}

@riverpod
class BookingStatus extends _$BookingStatus {
  @override
  AsyncValue<bool> build() => const AsyncValue.data(false);

  Future<void> submitBooking() async {
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
        'request_id': const Uuid().v1(),
      };
      final bidRepository = BidRepository(ref.read(dioClientProvider));
      await bidRepository.postBit(data);
      await Future.delayed(const Duration(milliseconds: 600));
      state = const AsyncValue.data(true);
    } catch (e) {
      state = const AsyncValue.data(false); // AsyncValue.error(e);
    }
  }
}

// @riverpod
// class PostBidStatus extends _$PostBidStatus {
//   @override
//   AsyncValue<void> build() => const AsyncValue.data(null);

//   Future<void> submitBid() async {
//     state = const AsyncValue.loading();
//     try {
//       Map<String, dynamic> data = {
//         'route_id': ref.read(mapNotifierProvider).selectedRoute?.id,
//         'quantity': ref.read(numberOfGuestsProvider),
//         'date_start': ref.read(selectedDateProvider),
//         'request_id': Uuid(),
//       };
//       final bidRepository = BidRepository(ref.read(dioClientProvider));
//       await bidRepository.postBit(data);
//       state = const AsyncValue.data(null); // Indicating success
//     } catch (e, stackTrace) {
//       state = AsyncValue.error(e, stackTrace);
//       logger.e('Failed to submit bid: $e');
//     }
//   }
// }
