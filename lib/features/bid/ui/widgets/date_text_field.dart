import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTextField extends ConsumerWidget {
  final TextEditingController controller;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  final String? errorText;
  final bool needLastDates;

  const DateTextField({
    super.key,
    required this.controller,
    required this.selectedDate,
    required this.onDateSelected,
    this.errorText,
    this.needLastDates = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.calendar_today),
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
    );
  }
}
