import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

import '../data/models/problem_data.dart';
import '../data/models/problem_type.dart';

part 'problem_state.freezed.dart';

@freezed
class ProblemState with _$ProblemState {
  const factory ProblemState({
    XFile? imageFile,
    LatLng? coordinates,
    @Default('') String description,
    ProblemType? category,
    @Default('') String phone,
    @Default(false) bool isSending,
    @Default(false) bool isSaving,
    String? errorMessage,
    @Default(false) bool savedLocally,
    @Default([]) List<ProblemData> allProblems,
    @Default(false) bool isGettingAll,
  }) = _ProblemState;

  const ProblemState._();
}
