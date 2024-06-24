import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/models/route_info.dart';
import '../../domain/routes_provider.dart';
import '../../data/models/route_response.dart';
import 'route_card.dart';

List<RouteInfo> routesGlobal = [];

class RoutesListWidget extends ConsumerWidget {
  const RoutesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRoutes = ref.watch(routesProviderProvider);
    return asyncRoutes.when(
      data: (RouteResponse data) {
        routesGlobal = data.routes;
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => RouteCard(
            route: data.routes[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: data.totalRoutesCount,
        );
      },
      loading: () => Center(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 64.h),
        child: const CircularProgressIndicator(),
      )),
      error: (Object error, StackTrace stackTrace) {
        return Center(
            child: Column(
          children: [
            SvgPicture.asset('assets/icons/attention.svg'),
            SizedBox(height: 12.h),
            const Text('Соединение отсутствует'),
            SizedBox(height: 16.h),
            ref.watch(routesLocalProviderProvider).when(
                loading: () => const SizedBox(),
                error: (Object error, StackTrace stackTrace) =>
                    const SizedBox(),
                data: (List<RouteInfo> data) {
                  routesGlobal = data;
                  return data.isEmpty
                      ? const SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.h,
                              ),
                              child: Text(
                                'Сохранённые маршруты',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => RouteCard(
                                route: data[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemCount: data.length,
                            ),
                          ],
                        );
                }),
          ],
        ));
      },
    );
  }
}
