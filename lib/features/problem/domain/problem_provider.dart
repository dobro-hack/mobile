import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:image_picker/image_picker.dart';

import '../../base/domain/app_providers.dart';
import '../data/models/problem.dart';
import '../data/models/problem_data.dart';
import '../data/models/problem_type.dart';
import '../data/repositories/problem_repository.dart';
import 'problem_state.dart';

class ProblemStateNotifier extends StateNotifier<ProblemState> {
  final ProblemRepository problemRepository;
  ProblemStateNotifier(this.problemRepository) : super(const ProblemState());

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
    state = const ProblemState();
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
      final isSuccessSend = await problemRepository.saveLocal(problem);
      debugPrint('Отправлено $isSuccessSend');
      state = state.copyWith(isSaving: false, savedLocally: !isSuccessSend);
    } catch (e) {
      debugPrint('Failed to SAVE problem: $e');
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

      final isSuccessSend = await problemRepository.postProblem(problem);
      debugPrint('Отправлено $isSuccessSend');
      state = state.copyWith(isSending: false, savedLocally: !isSuccessSend);
    } catch (e) {
      debugPrint('Failed to send problem: $e');
      state = state.copyWith(
        isSending: false,
        errorMessage: e.toString(),
        savedLocally: true,
      );
    }
  }

  Future<void> fetchAllProblems() async {
    try {
      state = state.copyWith(isSending: true, errorMessage: null);

      List<ProblemData> allProblems = await problemRepository.getAllProblems();

      state = state.copyWith(
        isSending: false,
        errorMessage: null,
      );
      debugPrint('Полученные проблемы: ${allProblems.length}');
    } catch (e) {
      debugPrint('Не удалось получить все проблемы: $e');
      state = state.copyWith(
        isSending: false,
        errorMessage: 'Не удалось получить все проблемы: $e',
      );
    }
  }
}

final problemStateProvider =
    StateNotifierProvider<ProblemStateNotifier, ProblemState>(
  (ref) => ProblemStateNotifier(ref.watch(problemRepositoryProvider)),
);

final problemRepositoryProvider = Provider<ProblemRepository>((ref) {
  return ProblemRepository(ref.read(dioClientProvider));
});

final allProblemsProvider = FutureProvider<List<ProblemData>>((ref) async {
  final repository = ref.read(problemRepositoryProvider);
  return await repository.getAllProblems();
});
