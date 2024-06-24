import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/theme/app_colors.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.title,
    required this.text,
    this.bottomWidget,
    this.needAvatar = true,
  });

  final String title;
  final String text;
  final Widget? bottomWidget;
  final bool needAvatar;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Container(
      padding: EdgeInsets.only(top: 8.h, bottom: 12.h, right: 12.w, left: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.greyBackgroundLight,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (needAvatar)
            CircleAvatar(
              radius: 24.r,
              backgroundImage: AssetImage('assets/images/mascot_avatar.png'),
            ),
          SizedBox(width: 12.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    text,
                  ),
                  bottomWidget ?? SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
