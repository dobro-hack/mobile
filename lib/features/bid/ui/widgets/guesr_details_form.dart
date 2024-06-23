import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../common/widgets/divider_grey.dart';
import 'date_text_field.dart';
import 'input_column.dart';

class GuestDetailsForm extends StatefulWidget {
  final int index;
  final GlobalKey<FormState> formKey;

  const GuestDetailsForm({
    super.key,
    required this.index,
    required this.formKey,
  });

  @override
  State<GuestDetailsForm> createState() => GuestDetailsFormState();
}

class GuestDetailsFormState extends State<GuestDetailsForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _thirdController = TextEditingController();
  TextEditingController _bdayController = TextEditingController();
  TextEditingController _passportController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _thirdController.dispose();
    _bdayController.dispose();
    _passportController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Text(
              '${'Посетитель'.toUpperCase()} №${widget.index}',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InputColumn(
                  title: 'Фамилия',
                  controller: _surnameController,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: InputColumn(
                  title: 'Имя',
                  controller: _nameController,
                ),
              ),
            ],
          ),
          InputColumn(
            title: 'Отчество',
            controller: _thirdController,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Дата рождения',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(height: 8.h),
                    DateTextField(
                      isRequired: true,
                      needLastDates: true,
                      controller: _bdayController,
                      selectedDate: null,
                      onDateSelected: (DateTime date) {
                        _bdayController.text = date.toString();
                        // DateFormat('dd.MM.yyyy').format(date);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: InputColumn(
                  title: 'Серия-номер паспорта',
                  controller: _passportController,
                ),
              ),
            ],
          ),
          const DividerGrey(),
        ],
      ),
    );
  }

  Map<String, dynamic> getFormData() {
    return {
      'first_name': _nameController.text,
      'middle_name': _surnameController.text,
      // 'last_name': _thirdController.text,
      'Passport': _passportController.text,
      'Birthday': _bdayController.text,
    };
  }
}
