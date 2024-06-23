import 'problem_data.dart';
import 'problem_status.dart';

class LocalProblem extends ProblemData {
  final String localId;

  LocalProblem({
    required super.message,
    required super.location,
    required super.type,
    required super.phone,
    super.fileUrl,
    required this.localId,
    required super.date,
  });

  @override
  ProblemStatus get status => ProblemStatus.notSend;
}
