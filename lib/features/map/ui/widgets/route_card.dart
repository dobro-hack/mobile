import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/theme/app_colors.dart';
import '../../domain/map_notifier_provider.dart';
import '../../data/models/route_info.dart';

class RouteCard extends ConsumerWidget {
  const RouteCard({
    super.key,
    required this.route,
  });

  final RouteInfo route;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return GestureDetector(
      onTap: () {
        ref.read(mapNotifierProvider.notifier).selectRoute(route);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 4.h),
              color: AppColors.black.withOpacity(0.04),
            ),
            BoxShadow(
              blurRadius: 4,
              color: AppColors.black.withOpacity(0.06),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  width: 114.w,
                  height: 80.h,
                  color: AppColors.green,
                  child: (route.photo != null && route.photo!.isNotEmpty)
                      ? Image.network(
                          route.photo![0],
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      route.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/distance.svg',
                              color: Theme.of(context).iconTheme.color,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '${route.length} км',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        SizedBox(width: 8.w),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/clock.svg',
                              color: Theme.of(context).iconTheme.color,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '${route.duration} ч',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        SizedBox(width: 8.w),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/info.svg',
                              color: Theme.of(context).iconTheme.color,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              route.difficulty.name,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
