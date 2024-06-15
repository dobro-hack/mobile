import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/divider_grey.dart';
import 'input_column.dart';

class GuestDetailsForm extends StatelessWidget {
  final int index;

  const GuestDetailsForm({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Text(
            '${'Посетитель'.toUpperCase()} №$index',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InputColumn(title: 'Фамилия'),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: InputColumn(title: 'Имя'),
            ),
          ],
        ),
        InputColumn(title: 'Отчество'),
        Row(
          children: [
            Expanded(
              child: InputColumn(title: 'Дата рождения'),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: InputColumn(title: 'Серия-номер паспорта'),
            ),
          ],
        ),
        const DividerGrey(),
      ],
    );
  }
}
