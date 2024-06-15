import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/grey_elev_button.dart';

class MyBids extends StatelessWidget {
  const MyBids({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 12.h,
            bottom: 8.h,
            right: 16.w,
            left: 16.w,
          ),
          child: Text(
            'Мои заявки',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Text(
                'Для посещения маршрутов, нужно подавать заявку не позднее, чем за 2 рабочих дня до планируемого путешествия',
                // textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: SizedBox(
                  width: double.infinity,
                  child: GreyElevButton(
                    text: 'Выбрать маршрут',
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
