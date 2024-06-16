import 'package:eco/common/navigation/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/divider_grey.dart';
import '../../../../common/widgets/green_elev_button.dart';
import '../../../../common/widgets/text_show_more.dart';
import '../../data/models/cell.dart';
import '../../data/models/route_info.dart';
import 'digital_card.dart';
import 'load_block.dart';
import 'note_widget.dart';
import 'places_block.dart';

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        controller: sc,
        children: [
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  route.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 4.h),
                TextShowMore(text: route.description),
              ],
            ),
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
          if (route.places != null) PlacesBlock(places: route.places!),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const DividerGrey(),
          ),
          if (route.load != null) LoadBlock(load: route.load!),
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
          ...cells
              .map((e) => ListTile(
                    leading: SvgPicture.asset(e.iconAsset),
                    title: Text(e.name),
                    subtitle: Text(
                      e.description,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ))
              .toList(),
          Padding(
            padding: EdgeInsets.all(16.h),
            child: NoteWidget(
              title: 'Скачайте маршрут на телефон',
              text: 'Приложение будет работать, даже если интернет пропадёт',
              bottomWidget:
                  TextButton(onPressed: () {}, child: const Text('Скачать')),
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
            child: const DividerGrey(),
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
            child: const DividerGrey(),
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
        ],
      ),
      bottomNavigationBar: Container(
        height: 68.h,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.greyLight))),
        child: GreenElevButton(
            onPressed: () {
              context.pushNamed(RouteName.bid);
            },
            text: 'Подать заявку на посещение'),
      ),
    );
  }
}
