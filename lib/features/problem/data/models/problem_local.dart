import 'problem_data.dart';
import 'problem_status.dart';

class LocalProblem extends ProblemData {
  final String localId;
  final DateTime savedAt; // Время сохранения

  LocalProblem({
    required super.message,
    required super.location,
    required super.type,
    required super.phone,
    super.fileUrl,
    required this.localId,
    required this.savedAt,
  });

  @override
  ProblemStatus get status => ProblemStatus.notSend;
}
