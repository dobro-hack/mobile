import 'dart:io';

import 'package:eco/features/problem/domain/problem_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../problem/data/models/problem_local.dart';

class NoSendedProblem extends ConsumerWidget {
  const NoSendedProblem({
    super.key,
    required this.problem,
  });
  final LocalProblem problem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint(problem.localId);
    return ListTile(
      leading: Container(
        clipBehavior: Clip.hardEdge,
        width: 48.h,
        height: 48.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black.withOpacity(0.08)),
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.greyBackgroundDark,
        ),
        child: problem.fileUrl != null
            ? Image.file(
                File(problem.fileUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      title: Text(
        problem.message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        problem.status.name,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.orange,
            ),
      ),
      trailing: IconButton(
        onPressed: () async {
          await ref.read(problemStateProvider.notifier).resentProblem(problem);
          ref.refresh(allProblemsProvider);
        },
        icon: const Icon(
          Icons.repeat,
          color: AppColors.greyDark,
        ),
      ),
    );
  }
}
