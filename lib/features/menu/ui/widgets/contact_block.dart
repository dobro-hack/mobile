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
                  'site.ru',
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
                  'Главый по чему-то',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '+7 (909) 135 222-2',
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
                  'Эмайл главного по чему-то там',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'priroda@mail.ru',
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
