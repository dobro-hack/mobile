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
  final ProblemType? category;

  ProblemState({
    this.imageFile,
    this.coordinates,
    this.description = '',
    this.category,
  });

  ProblemState copyWith({
    XFile? imageFile,
    LatLng? coordinates,
    String? description,
    ProblemType? category,
  }) {
    return ProblemState(
      imageFile: imageFile ?? this.imageFile,
      coordinates: coordinates ?? this.coordinates,
      description: description ?? this.description,
      category: category ?? this.category,
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

  void updateCategory(ProblemType category) {
    state = state.copyWith(category: category);
  }

  void resetState() {
    state = ProblemState();
  }

  Future<void> sendProblem() async {
    try {
      // Создаем объект Problem на основе текущего состояния
      Problem problem = Problem(
        photo: state.imageFile,
        latitude: state.coordinates?.latitude ?? 0.0,
        longitude: state.coordinates?.longitude ?? 0.0,
        type: state.category,
        message: state.description,
      );

      // Отправляем проблему на сервер через репозиторий
      await problemRepository.postProblem(problem);
      print('Отправлено');

      // Опционально: очистка состояния после отправки
      resetState();
    } catch (e) {
      // Обработка ошибок при отправке
      print('Failed to send problem: $e');
      throw e; // Можно выбросить исключение для дальнейшей обработки в UI
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
