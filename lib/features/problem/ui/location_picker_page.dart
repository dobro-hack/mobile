import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/green_elev_button.dart';
import '../../map/data/repositories/location_repository.dart';

class LocationPickerPage extends StatefulWidget {
  const LocationPickerPage({super.key});

  @override
  State<LocationPickerPage> createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  LatLng _currentPosition = LatLng(53.024263, 158.643504); // Начальная позиция
  LatLng? _myPoint;
  final LocationRepository _locationRepository = LocationRepository();
  final MapController _mapController = MapController();

  void _onMapTapped(LatLng position) {
    setState(() {
      _currentPosition = position;
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await _locationRepository.getCurrentLocation();
      LatLng newPoint = LatLng(position.latitude, position.longitude);

      setState(() {
        _myPoint = newPoint;
        _currentPosition = newPoint;
      });

      _mapController.move(newPoint, _mapController.zoom);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Не удалось определить текущее местоположение: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/cancel.svg'),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text('Место на карте'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(32.w),
            child: Text(
              'Укажите место на карте, где была найдена проблема. Если с этим есть проблема - опишите место текстом как можно подробнее',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    center: _currentPosition,
                    zoom: 13.0,
                    onTap: (tapPosition, point) {
                      _onMapTapped(point);
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: _currentPosition,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                        if (_myPoint != null)
                          Marker(
                            width: 20.0,
                            height: 20.0,
                            point: _myPoint!,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 3.w,
                                    color: AppColors.white,
                                  ),
                                  color: AppColors.green),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 12,
                  right: 4,
                  child: ElevatedButton(
                    onPressed: _getCurrentLocation,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: EdgeInsets.all(8.w),
                    ),
                    child: SvgPicture.asset('assets/icons/location.svg'),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(8.w),
              width: 48.h,
              height: 48.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black.withOpacity(0.08)),
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.greyBackgroundLight,
              ),
              child: SvgPicture.asset(
                'assets/icons/location.svg',
                color: AppColors.textGreySecondary,
              ),
            ),
            title: Text(
              'Координаты',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              '${_currentPosition.latitude}, ${_currentPosition.longitude}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GreenElevButton(
              onPressed: () {
                Navigator.pop(context, {
                  'latitude': _currentPosition.latitude,
                  'longitude': _currentPosition.longitude
                });
              },
              text: 'Готово',
            ),
          ),
        ],
      ),
    );
  }
}
