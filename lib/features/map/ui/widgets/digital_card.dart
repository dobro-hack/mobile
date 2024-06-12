import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/theme/app_colors.dart';

class DigitalCard extends StatelessWidget {
  const DigitalCard({
    super.key,
    required this.description,
    required this.value,
  });
  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.greyLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            description,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 2.h),
          Text(value),
        ],
      ),
    );
  }
}
