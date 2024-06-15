import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class DividerGrey extends StatelessWidget {
  const DividerGrey({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.greyMedium,
      thickness: 0.5,
    );
  }
}
