import 'package:image_picker/image_picker.dart';

import 'problem_type.dart';

class Problem {
  final double latitude;
  final double longitude;
  final ProblemType? type;
  final String message;
  final String phone;
  final XFile? photo;

  Problem({
    required this.latitude,
    required this.longitude,
    required this.type,
    required this.message,
    this.photo,
    required this.phone,
  });
}
