import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../problem/data/models/problem_back.dart';

class SendedProblem extends StatelessWidget {
  const SendedProblem({
    super.key,
    required this.problemBack,
  });
  final ProblemBack problemBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8.w),
        width: 48.h,
        height: 48.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black.withOpacity(0.08)),
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.green,
        ),
      ),
      title: Text(
        problemBack.message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '${DateFormat('dd.MM.yyyy').format(problemBack.sentAt)} • ${problemBack.status.name}',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textGreySecondary,
            ),
      ),
    );
  }
}
