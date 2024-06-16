import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputColumn extends StatelessWidget {
  const InputColumn({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            controller: controller,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            validator: title == 'Отчество'
                ? null
                : (value) {
                    if (value == null || value.isEmpty) {
                      return 'Обязательное поле';
                    }
                    return null;
                  },
          ),
        ],
      ),
    );
  }
}
