import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  await Future.delayed(Duration(milliseconds: 600));
  return true;
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
        throw Exception('Date not selected');
      }

      await Future.delayed(const Duration(milliseconds: 600));
      state = const AsyncValue.data(true);
    } catch (e) {
      state = const AsyncValue.data(false); // AsyncValue.error(e);
    }
  }
}
