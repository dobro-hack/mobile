import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/bid/ui/bid_page.dart';
import '../../features/map/ui/map_page.dart';
import '../../features/menu/ui/menu_page.dart';
import '../../features/problem/ui/location_picker_page.dart';
import '../../features/problem/ui/problem_page.dart';
import 'route_name.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteName.home,
  routes: <RouteBase>[
    GoRoute(
      name: RouteName.home,
      path: RouteName.home,
      builder: (BuildContext context, GoRouterState state) {
        return const MapPage();
      },
      routes: [
        GoRoute(
          name: RouteName.problem,
          path: RouteName.problem,
          builder: (BuildContext context, GoRouterState state) {
            return const ProblemPage();
          },
          routes: [
            GoRoute(
              name: RouteName.selectLocation,
              path: RouteName.selectLocation,
              builder: (BuildContext context, GoRouterState state) {
                return const LocationPickerPage();
              },
            ),
          ],
        ),
        GoRoute(
          name: RouteName.menu,
          path: RouteName.menu,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: MenuPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin:
                        Offset(1.0, 0.0), // Переход начинает с правой стороны
                    end: Offset.zero, // Переход заканчивается в центре
                  ).animate(animation),
                  child: child,
                );
              },
            );
          },
          // builder: (BuildContext context, GoRouterState state) {
          //   return const ProblemPage();
          // },
        ),
        GoRoute(
          name: RouteName.bid,
          path: RouteName.bid,
          builder: (BuildContext context, GoRouterState state) {
            return const BidPage();
          },
        ),
      ],
    ),
  ],
);
