import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTextField extends ConsumerWidget {
  final TextEditingController controller;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  final String? errorText;

  const DateTextField({
    Key? key,
    required this.controller,
    required this.selectedDate,
    required this.onDateSelected,
    this.errorText,
  }) : super(key: key);

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
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },
    );
  }
}
