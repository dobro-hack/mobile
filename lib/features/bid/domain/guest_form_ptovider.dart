import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final guestFormProvider =
    StateProviderFamily<FormState, int>((ref, guestIndex) => FormState());
