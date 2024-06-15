import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/navigation/route_name.dart';
import '../../../../common/theme/app_colors.dart';

class MapAppBar extends StatelessWidget {
  const MapAppBar({
    super.key,
    this.callBack,
  });

  final Function? callBack;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 12.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.pushNamed(RouteName.menu);
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(8.w),
                ),
                child: SvgPicture.asset('assets/icons/menu.svg')),
            // SizedBox(width: 8.w),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(RouteName.problem);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                foregroundColor: AppColors.black,
              ),
              child: const Text('Сообщить о проблеме'),
            ),
            if (callBack != null)
              Expanded(
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        debugPrint('callback');
                        callBack!();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.all(8.w),
                      ),
                      child: SvgPicture.asset('assets/icons/chevron_left.svg'),
                    ),
                  ],
                ),
              ),
          ].reversed.toList(),
        ),
      ),
    );
  }
}
