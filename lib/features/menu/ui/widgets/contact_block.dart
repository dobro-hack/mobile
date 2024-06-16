import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactBlock extends StatelessWidget {
  const ContactBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
            child: Text(
              'Контакты',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Сайт',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'eco.kamgov.ru',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Телефон',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '+7 (4152) 42-01-74',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'priroda@kamgov.ru',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Версия приложения',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                // вычислять
                Text(
                  '1.0.0',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
