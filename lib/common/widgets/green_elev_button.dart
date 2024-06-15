import 'package:flutter/material.dart';

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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          foregroundColor: AppColors.white,
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
