import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:image_picker/image_picker.dart';

import '../../base/domain/app_providers.dart';
import '../data/models/problem.dart';
import '../data/models/problem_type.dart';
import '../data/repositories/problem_repository.dart';

class ProblemState {
  final XFile? imageFile;
  final LatLng? coordinates;
  final String description;
  final String phone;
  final ProblemType? category;
  final bool isSending;
  final bool isSaving;
  final String? errorMessage;
  final bool savedLocally;

  ProblemState({
    this.imageFile,
    this.coordinates,
    this.description = '',
    this.category,
    this.phone = '',
    this.isSending = false,
    this.isSaving = false,
    this.errorMessage,
    this.savedLocally = false,
  });

  ProblemState copyWith({
    XFile? imageFile,
    LatLng? coordinates,
    String? description,
    ProblemType? category,
    String? phone,
    bool? isSending,
    bool? isSaving,
    String? errorMessage,
    bool? savedLocally,
  }) {
    return ProblemState(
      imageFile: imageFile ?? this.imageFile,
      coordinates: coordinates ?? this.coordinates,
      description: description ?? this.description,
      category: category ?? this.category,
      phone: phone ?? this.phone,
      isSending: isSending ?? this.isSending,
      isSaving: isSaving ?? this.isSaving,
      errorMessage: errorMessage,
      savedLocally: savedLocally ?? this.savedLocally,
    );
  }
}

class ProblemStateNotifier extends StateNotifier<ProblemState> {
  final ProblemRepository problemRepository;
  ProblemStateNotifier(this.problemRepository) : super(ProblemState());

  void updateImage(XFile? image) {
    state = state.copyWith(imageFile: image);
  }

  void updateCoordinates(LatLng? coordinates) {
    state = state.copyWith(coordinates: coordinates);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updatePhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  void updateCategory(ProblemType category) {
    state = state.copyWith(category: category);
  }

  void resetState() {
    state = ProblemState();
  }

  Future<void> saveProblem() async {
    try {
      state = state.copyWith(isSaving: true, errorMessage: null);

      Problem problem = Problem(
        photo: state.imageFile,
        latitude: state.coordinates!.latitude, // ?? 0.0,
        longitude: state.coordinates!.longitude, // ?? 0.0,
        type: state.category,
        message: state.description,
        phone: state.phone,
      );

      // Отправляем проблему на сервер через репозиторий
      final isSuccessSend = await problemRepository.saveLocal(problem);
      print('Отправлено $isSuccessSend');
      state = state.copyWith(isSaving: false, savedLocally: !isSuccessSend);
    } catch (e) {
      print('Failed to SAVE problem: $e');
      state = state.copyWith(
        isSaving: false,
        errorMessage: e.toString(),
        savedLocally: true,
      );
    }
  }

  Future<void> sendProblem() async {
    try {
      if (state.coordinates == null || state.description.isEmpty) {
        throw Exception('Необходимо указать координаты и описание');
      }

      state = state.copyWith(isSending: true, errorMessage: null);

      Problem problem = Problem(
        photo: state.imageFile,
        latitude: state.coordinates!.latitude, // ?? 0.0,
        longitude: state.coordinates!.longitude, // ?? 0.0,
        type: state.category,
        message: state.description,
        phone: state.phone,
      );

      // Отправляем проблему на сервер через репозиторий
      final isSuccessSend = await problemRepository.postProblem(problem);
      print('Отправлено $isSuccessSend');
      state = state.copyWith(isSending: false, savedLocally: !isSuccessSend);
    } catch (e) {
      // Обработка ошибок при отправке
      print('Failed to send problem: $e');
      state = state.copyWith(
        isSending: false,
        errorMessage: e.toString(),
        savedLocally: true,
      );
      // throw e; // Можно выбросить исключение для дальнейшей обработки в UI
    }
  }
}

// Provider для создания ProblemStateNotifier с использованием ProblemRepository
final problemStateProvider =
    StateNotifierProvider<ProblemStateNotifier, ProblemState>(
  (ref) => ProblemStateNotifier(ref.watch(problemRepositoryProvider)),
);

// Вам нужно создать провайдер для вашего ProblemRepository
final problemRepositoryProvider = Provider<ProblemRepository>((ref) {
  return ProblemRepository(ref.read(dioClientProvider));
});
