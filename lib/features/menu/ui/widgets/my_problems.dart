import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/navigation/route_name.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/grey_elev_button.dart';
import '../../../problem/data/models/problem_data.dart';
import '../../../problem/data/models/problem_status.dart';
import '../../../problem/domain/problem_provider.dart';

class MyProblems extends ConsumerStatefulWidget {
  const MyProblems({super.key});

  @override
  ConsumerState<MyProblems> createState() => _MyProblemsState();
}

class _MyProblemsState extends ConsumerState<MyProblems> {
  @override
  void initState() {
    super.initState();
    ref.refresh(allProblemsProvider);
  }

  @override
  Widget build(BuildContext context) {
    final asyncProblems = ref.watch(allProblemsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 12.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Text(
            'Мои cообщения',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        asyncProblems.when(
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            error: (Object error, StackTrace stackTrace) =>
                Text(error.toString()),
            data: (List<ProblemData> data) {
              return data.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          Text(
                            'Если встретите на маршрутах мусор, костры, несанкционированное что-то сообщите нам, мы постараемся всё исправить', // textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: SizedBox(
                              width: double.infinity,
                              child: GreyElevButton(
                                text: 'Сообщить о проблеме',
                                onPressed: () {
                                  context.pushNamed(RouteName.problem);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: data
                          .map(
                            (e) => ListTile(
                              leading: Container(
                                padding: EdgeInsets.all(8.w),
                                width: 48.h,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.black.withOpacity(0.08)),
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: AppColors.green,
                                ),
                              ),
                              title: Text(
                                e.message,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                e.status.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      color: e.status == ProblemStatus.notSend
                                          ? AppColors.orange
                                          : AppColors.textGreySecondary,
                                    ),
                              ),
                            ),
                          )
                          .toList(),
                    );
            }),
      ],
    );
  }
}
