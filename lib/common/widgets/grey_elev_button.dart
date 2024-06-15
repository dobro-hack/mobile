import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class GreyElevButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const GreyElevButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.greyBackgroundLight,
        foregroundColor: AppColors.black,
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(text),
    );
  }
}
