import 'package:eco/features/bid/data/models/bid.dart';
import 'package:eco/features/bid/domain/bid_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common/logger.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/grey_elev_button.dart';
import '../../../map/ui/widgets/routes_list_widget.dart';

class MyBids extends ConsumerStatefulWidget {
  const MyBids({super.key});

  @override
  ConsumerState<MyBids> createState() => _MyBidsState();
}

class _MyBidsState extends ConsumerState<MyBids> {
  bool showAll = false;
  @override
  void initState() {
    super.initState();
    ref.refresh(allBidsProvider);
  }

  String name(int id) {
    String res = 'Маршрут';
    if (routesGlobal.isNotEmpty) {
      try {
        res = routesGlobal.firstWhere((e) => e.id == id).name;
      } catch (e) {
        logger.e(e);
      }
    }
    return res;
  }

  String? image(int id) {
    String? res;
    if (routesGlobal.isNotEmpty) {
      try {
        res = routesGlobal.firstWhere((e) => e.id == id).photo?.first;
      } catch (e) {
        logger.e(e);
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final asyncBids = ref.watch(allBidsProvider);
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
        asyncBids.when(
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            error: (Object error, StackTrace stackTrace) =>
                Text(error.toString()),
            data: (List<Bid> data) {
              return data.isEmpty
                  ? Padding(
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
                    )
                  : Column(
                      children: [
                        ListView.builder(
                          itemBuilder: (context, index) => ListTile(
                            leading: Container(
                              clipBehavior: Clip.hardEdge,
                              width: 48.h,
                              height: 48.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.black.withOpacity(0.08)),
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.greyBackgroundDark,
                              ),
                              child: image(data[index].routeId) != null
                                  ? Image.network(
                                      image(data[index].routeId)!,
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            title: Text(
                              name(data[index].routeId),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              DateFormat('dd.MM.yyyy')
                                  .format(data[index].dateStart),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: AppColors.textGreySecondary,
                                  ),
                            ),
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: showAll
                              ? data.length
                              : (data.length > 3 ? 3 : data.length),
                        ),
                        if (data.length > 3)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.greyBackgroundLight,
                                ),
                                onPressed: () {
                                  setState(() {
                                    showAll = !showAll;
                                  });
                                },
                                child:
                                    Text(showAll ? 'Свернуть' : 'Показать ещё'),
                              ),
                            ),
                          ),
                      ],
                    );
            }),
      ],
    );
  }
}
