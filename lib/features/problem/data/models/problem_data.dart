import 'location_problem.dart';
import 'problem_status.dart';
import 'problem_type.dart';

abstract class ProblemData {
  final String message;
  final LocationProblem location;
  final ProblemType type;
  final String phone;
  final DateTime date;
  final String? fileUrl; // Локальный путь или URL файла

  ProblemData({
    required this.message,
    required this.location,
    required this.type,
    required this.phone,
    required this.date,
    this.fileUrl,
  });

  ProblemStatus get status;
}
