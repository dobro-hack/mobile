import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'booking_models.dart';

part 'bid_provider.g.dart';

// Провайдер для создания Dio
final dioProvider = Provider<Dio>((ref) => Dio());

// Провайдер для хранения выбранной даты
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

// Провайдер для хранения количества гостей
@riverpod
class NumberOfGuests extends _$NumberOfGuests {
  @override
  int build() => 1;

  void setNumberOfGuests(int count) {
    state = count;
  }
}

// Провайдер для проверки доступности даты
@riverpod
Future<bool> dateAvailability(DateAvailabilityRef ref, DateTime date) async {
  // final dio = ref.watch(dioProvider);
  // final response = await dio.get(
  //   'https://api.example.com/check-date',
  //   queryParameters: {'date': date.toIso8601String()},
  // );
  // final data = BookingResponse.fromJson(response.data);
  // return data.isAvailable;
  print(ref.read(numberOfGuestsProvider));
  await Future.delayed(Duration(milliseconds: 600));
  return true;
  // return false;
}

// Провайдер для хранения статуса бронирования
@riverpod
class BookingStatus extends _$BookingStatus {
  @override
  AsyncValue<bool> build() => const AsyncValue.data(false);

  Future<void> submitBooking() async {
    state = const AsyncValue.loading();
    try {
      final dio = ref.read(dioProvider);
      final selectedDate = ref.read(selectedDateProvider);
      final numberOfGuests = ref.read(numberOfGuestsProvider);
      print(selectedDate);
      if (selectedDate == null) {
        throw Exception('Date not selected');
      }

      // final bookingData = BookingRequest(
      //   numberOfGuests: numberOfGuests,
      //   visitDate: selectedDate,
      // );

      // final response = await dio.post(
      //   'https://api.example.com/book',
      //   data: bookingData.toJson(),
      // );

      // if (response.statusCode == 200) {
      //   state = const AsyncValue.data(true);
      // } else {
      //   throw Exception('Booking failed');
      // }

      await Future.delayed(Duration(milliseconds: 600));
      state = const AsyncValue.data(true);
    } catch (e) {
      state = const AsyncValue.data(false); // AsyncValue.error(e);
    }
  }
}
