import 'dart:convert';

import 'package:eco/common/logger.dart';
import 'package:eco/features/map/data/models/route_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteManager {
  static const String _selectedRoutesKey = 'selected_routes';

  // Сохранение выбранного маршрута в SharedPreferences
  static Future<void> saveSelectedRoute(RouteInfo route) async {
    logger.i('saveSelectedRoute');
    final prefs = await SharedPreferences.getInstance();
    List<RouteInfo> routes = await loadSelectedRoutes();
    routes.add(route);
    final jsonList = routes.map((route) => route.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    print(jsonString);
    await prefs.setString(_selectedRoutesKey, jsonString);
    logger.i(prefs.get(_selectedRoutesKey));
  }

  // Загрузка выбранных маршрутов из SharedPreferences
  static Future<List<RouteInfo>> loadSelectedRoutes() async {
    logger.i('loadSelectedRoutes');
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_selectedRoutesKey);
    print(jsonString);
    if (jsonString != null) {
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList.map((json) => RouteInfo.fromJson(json)).toList();
    }
    return [];
  }

  // Удаление выбранного маршрута из SharedPreferences
  static Future<void> removeSelectedRoute(RouteInfo route) async {
    final prefs = await SharedPreferences.getInstance();
    List<RouteInfo> routes = await loadSelectedRoutes();
    routes.removeWhere((r) => r.id == route.id); // Удаление по ID
    final jsonList = routes.map((route) => route.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await prefs.setString(_selectedRoutesKey, jsonString);
  }

  // Проверка наличия маршрута в SharedPreferences
  static Future<bool> isRouteSaved(RouteInfo route) async {
    final savedRoutes = await loadSelectedRoutes();
    return savedRoutes.any((savedRoute) => savedRoute.id == route.id);
  }
}
