import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../features/map/ui/map_page.dart';
import 'navigation/router.dart';
import 'theme/theme_light.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Eco app',
      theme: themeLight,
      routerConfig: router,
    );
  }
}
