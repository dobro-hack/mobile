import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/utils.dart';
import 'chart.dart';
import 'note_widget.dart';

class LoadBlock extends StatelessWidget {
  const LoadBlock({
    super.key,
    required this.load,
  });

  final List<int> load;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Text(
            'Загруженность',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: CustomLineChart(
              data: List.generate(365, (index) => Random().nextInt(50)),
              maxData: List.generate(365, (index) => Random().nextInt(10) + 50),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.h),
          child: const NoteWidget(
            title: 'Как выбрать даты?',
            text:
                'Лучше выбирать дни с наименьшей загрузкой. Если параметр максимальной вместимости превышен - мы не сможем разрешить посещение.',
          ),
        ),
      ],
    );
  }
}
