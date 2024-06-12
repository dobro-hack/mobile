import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../data/domain/route_state.dart';
import 'widgets/map_app_bar.dart';
import 'widgets/scroll_panel_info.dart';
import 'widgets/scroll_panel_with_list.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  double locationHight = 175;
  bool visible = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      locationHight = MediaQuery.of(context).size.height * 0.3 + 12.h;
      visible = true;
      setState(() {});
    });
  }

  void _onBackPressed() {
    // Сброс выбора маршрута
    ref.read(mapNotifierProvider.notifier).clearSelectedRoute();
    // Сдвигаем панель до минимальной высоты
    // _panelController.close();
    print(ref.read(mapNotifierProvider).selectedRoute);
  }

  @override
  Widget build(BuildContext context) {
    final maxH = MediaQuery.of(context).size.height * 0.8;
    final minH = MediaQuery.of(context).size.height * 0.3;
    final mapState = ref.watch(mapNotifierProvider);
    final selectedRoute = mapState.selectedRoute;
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              SlidingUpPanel(
                maxHeight: maxH,
                minHeight: minH,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                parallaxEnabled: true,
                parallaxOffset: 0.5,
                body: Container(color: Colors.green),
                panelBuilder: (sc) => selectedRoute == null
                    ? ScrollPanelWithList(sc: sc)
                    : ScrollPanelInfo(
                        sc: sc,
                        route: selectedRoute,
                      ),
                onPanelSlide: (position) {
                  final hightKoef = maxH - minH;
                  locationHight = position * hightKoef + minH + 12.h;
                  setState(() {});
                },
              ),
              if (visible)
                Positioned(
                  right: 4.w,
                  bottom: locationHight,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.all(8.w),
                      ),
                      child: SvgPicture.asset('assets/icons/location.svg')),
                ),
            ],
          ),
          MapAppBar(
            callBack: selectedRoute == null ? null : _onBackPressed,
          ),
        ],
      ),
    );
  }
}
