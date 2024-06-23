import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class GreenElevButton extends StatelessWidget {
  const GreenElevButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
  });
  final String? text;
  final Function? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.green,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.green.withOpacity(0.64),
          disabledForegroundColor: AppColors.white.withOpacity(0.64),
        ),
        onPressed: onPressed != null
            ? () {
                onPressed!();
              }
            : null,
        child: child ?? (text != null ? Text(text!) : null),
      ),
    );
  }
}
