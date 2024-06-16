import 'package:eco/features/problem/data/models/problem_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../problem/data/models/problem_data.dart';
import '../../../problem/data/models/problem_local.dart';
import '../../../problem/domain/problem_provider.dart';
import 'no_problems_block.dart';
import 'no_sended_problem.dart';
import 'sended_problem.dart';

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
                  ? const NoProblemsBlock()
                  : Column(
                      children: data
                          .map(
                            (e) => e is ProblemBack
                                ? SendedProblem(problemBack: e)
                                : NoSendedProblem(problem: e as LocalProblem),
                          )
                          .toList(),
                    );
            }),
      ],
    );
  }
}
