import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/map/ui/map_page.dart';
import '../../features/problem/problem_page.dart';
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
        ),
      ],
    ),
  ],
);
