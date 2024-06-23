import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTextField extends ConsumerWidget {
  final TextEditingController controller;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  final String? errorText;
  final bool needLastDates;
  final bool isRequired;

  const DateTextField({
    super.key,
    required this.controller,
    required this.selectedDate,
    required this.onDateSelected,
    this.errorText,
    this.needLastDates = false,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.calendar_today),
        errorText: errorText,
      ),
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: needLastDates ? DateTime(1900) : DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },
      validator: !isRequired
          ? null
          : (value) {
              if (value == null || value.isEmpty) {
                return 'Обязательное поле';
              }
              return null;
            },
    );
  }
}
