import 'package:eco/common/navigation/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/green_elev_button.dart';
import '../../../../common/widgets/text_show_more.dart';
import '../../data/models/route_info.dart';
import '../../data/utils.dart';
import 'chart.dart';
import 'digital_card.dart';
import 'note_widget.dart';
import 'place_short_widget.dart';

class ScrollPanelInfo extends StatelessWidget {
  final ScrollController sc;
  final RouteInfo route;
  const ScrollPanelInfo({
    required this.sc,
    super.key,
    required this.route,
  });

  get itemCount => null;

  @override
  Widget build(BuildContext context) {
    Map<String, List<int>> monthlyData = prepareDataForChart(route.load);

    // Получаем список значений и месяцев
    List<int> data = monthlyData.values.expand((weeks) => weeks).toList();
    List<String> months = monthlyData.keys.toList();
    return ListView(
      controller: sc,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                route.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 4.h),
              // Text(route.description),
              TextShowMore(text: route.description),
            ],
          ),
          // child: FiltersPlace(),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          height: 86.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 16.w),
              DigitalCard(
                description: 'Длина',
                value: '${route.length} км',
              ),
              SizedBox(width: 8.w),
              DigitalCard(
                description: 'Длительность',
                value: '${route.duration} ч',
              ),
              SizedBox(width: 8.w),
              DigitalCard(
                description: 'Сложность',
                value: route.difficulty.name,
              ),
              SizedBox(width: 8.w),
              DigitalCard(
                description: 'Макс.высота',
                value: '${route.height} м',
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Text(
            'На маршруте',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          height: 124.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 12.w),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: route.places
                    .map((pl) => PlaceShortWidget(place: pl))
                    .toList(),
              ),
              SizedBox(width: 12.w),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Divider(
            color: Colors.red,
          ),
        ),
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
              data: data,
              months: months,
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
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Text(
            'Качество связи',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Text('тут операторы'),
        Padding(
          padding: EdgeInsets.all(16.h),
          child: NoteWidget(
            title: 'Скачайте маршрут на телефон',
            text: 'Приложение будет работать, даже если интернет пропадёт',
            bottomWidget:
                TextButton(onPressed: () {}, child: Text('Скачать * 86 мб')),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Text(
            'Как добраться',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: TextShowMore(text: route.howToGet),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Divider(
            color: Colors.red,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Text(
            'Что взять с собой',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: TextShowMore(text: route.whatToTake),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Divider(
            color: Colors.red,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Text(
            'В случае экстренной ситуации',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: TextShowMore(text: route.inEmergency),
        ),
        Padding(
          padding: EdgeInsets.all(16.h),
          child: const NoteWidget(
            title: 'Пожалуйста, соблюдайте чистоту на маршруте',
            text:
                'На карте отмечены специальные места, где вы можете оставить свой мусор ',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GreenElevButton(
              onPressed: () {
                context.pushNamed(RouteName.bid);
              },
              text: 'Подать заявку на посещение'),
        )
      ],
    );
  }
}
