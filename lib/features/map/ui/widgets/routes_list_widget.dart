import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/routes_provider.dart';
import '../../data/models/route_response.dart';
import 'route_card.dart';

class RoutesListWidget extends ConsumerWidget {
  const RoutesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRoutes = ref.watch(routesProviderProvider);
    return asyncRoutes.when(
      data: (RouteResponse data) {
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
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (Object error, StackTrace stackTrace) => Center(
          child: Column(
        children: [
          SvgPicture.asset('assets/icons/attention.svg'),
          SizedBox(height: 12.h),
          const Text('Соединение отсутствует'),
        ],
      )),
    );
  }
}
