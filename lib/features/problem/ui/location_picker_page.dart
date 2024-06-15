import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/green_elev_button.dart';
import '../../map/data/repositories/location_repository.dart';
import '../../map/domain/location_provider.dart';

class LocationPickerPage extends ConsumerStatefulWidget {
  const LocationPickerPage({super.key});

  @override
  ConsumerState<LocationPickerPage> createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends ConsumerState<LocationPickerPage> {
  LatLng _currentPosition = LatLng(53.024263, 158.643504); // Начальная позиция

  final MapController _mapController = MapController();

  void _onMapTapped(LatLng position) {
    setState(() {
      _currentPosition = position;
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      await ref.read(locationProviderProvider.notifier).getCurrentLocation();

      LatLng? newPoint = ref.read(locationProviderProvider).myPoint;
      if (newPoint != null) {
        setState(() {
          _currentPosition = newPoint;
        });

        _mapController.move(newPoint, _mapController.zoom);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Не удалось определить текущее местоположение')),
        );
      }
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
                        if (ref.watch(locationProviderProvider).myPoint != null)
                          Marker(
                            width: 20.0,
                            height: 20.0,
                            point: ref.watch(locationProviderProvider).myPoint!,
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
                    child: ref.watch(locationProviderProvider).isLoading == true
                        ? CircularProgressIndicator()
                        : SvgPicture.asset('assets/icons/location.svg'),
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
