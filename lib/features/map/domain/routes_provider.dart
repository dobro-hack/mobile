import 'package:eco/features/map/data/models/route_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../base/domain/app_providers.dart';
import '../data/models/route_response.dart';
import '../data/repositories/route_manager.dart';
import '../data/repositories/route_repository.dart';

part 'routes_provider.g.dart';

@riverpod
Future<RouteResponse> routesProvider(RoutesProviderRef ref) async {
  final repository = RouteRepository(ref.read(dioClientProvider));
  return await repository.getRoutes();
}

@riverpod
Future<List<RouteInfo>> routesLocalProvider(RoutesLocalProviderRef ref) async {
  return await RouteManager.loadSelectedRoutes();
}
